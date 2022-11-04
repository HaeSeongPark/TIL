//
//  NetworkClient.swift
//  KidsNoteHomework
//
//  Created by rhino Q on 2022/11/02.
//

import Foundation
import RxSwift

enum NetworkError: Error {
    case transportError(Error)
    case responseError(statusCode: Int)
    case noData
    case decodingError(Error)
    
    var description:String {
        switch self {
        case .transportError(let error):
            return "네트워크 에러 \(error.localizedDescription)"
        case .responseError(let statusCode):
            return "리스폰스 에러 \(statusCode)"
        case .noData:
            return "검색결과 없습니다."
        case .decodingError(let error):
            return "디코딩 에러 \(error.localizedDescription)"
        }
    }
}

protocol NetworkService {
    @discardableResult
    func getResult<T:Decodable>(
        searchText:String,
        startIndex:Int,
        completion: @escaping (Result<T,NetworkError>) -> Void) -> URLSessionDataTask
    
    func getResult<T:Decodable>(
        searchText:String,
        startIndex:Int
    ) -> Observable<T>
}

final class NetworkClient:NetworkService {
    func getResult<T:Decodable>(searchText: String, startIndex: Int) -> Observable<T> {
        return Observable.create { observer in
            let task = self.getResult(searchText: searchText, startIndex: startIndex) { (result:Result<T,NetworkError>) in
                switch result {
                case .success(let searchResult):
                    observer.onNext(searchResult)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            task.resume()
            
            return Disposables.create { task.cancel() }
        }
        
    }
    
    
    let baseURL: String
    let session: URLSession
    let responseQueue: DispatchQueue?
    
    static let shared =
    NetworkClient(
        baseURL: "https://www.googleapis.com/books/v1/volumes",
        session: .shared,
        responseQueue: .main)
    
    init(baseURL: String,
         session: URLSession,
         responseQueue: DispatchQueue?) {
        self.baseURL = baseURL
        self.session = session
        self.responseQueue = responseQueue
    }
    
    func getResult<T:Decodable>(
        searchText:String,
        startIndex:Int,
        completion: @escaping ((Result<T,NetworkError>) -> Void)) -> URLSessionDataTask {
            let url = SearchURLBuilder.build(baseURL: baseURL, searchText: searchText, startIndex: startIndex)
            
            let task = session.dataTask(with: url) { [weak self] data, response, error in
                
                guard let self = self else { return }
                
                if let error = error {
                    self.dispatchResult {
                        completion(.failure(NetworkError.transportError(error)))
                    }
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(200..<300).contains(httpResponse.statusCode) {
                    self.dispatchResult {
                        completion(.failure(NetworkError.responseError(statusCode: httpResponse.statusCode)))
                    }
                    return
                }
                
                guard let data = data else {
                    self.dispatchResult {
                        completion(.failure(NetworkError.noData))
                    }
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let searchReulst = try decoder.decode(T.self, from: data)
                    self.dispatchResult {
                        completion(.success(searchReulst))
                    }
                } catch {
                    self.dispatchResult {
                        completion(.failure(NetworkError.decodingError(error)))
                    }
                }
            }
            task.resume()
            return task
        }
    
    private func dispatchResult(completion: @escaping ()->Void) {
        guard let responseQueue = responseQueue else {
            completion()
            return
        }
        
        responseQueue.async {
            completion()
        }
        
    }
}
