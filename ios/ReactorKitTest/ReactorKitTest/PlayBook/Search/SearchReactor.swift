//
//  SearchReactor.swift
//  ReactorKitTest
//
//  Created by rhino Q on 2022/11/02.
// diffableDataSource 붙이기
// collectionView diffbl, compositionaly 해보기

// 네트워크, 이미지도 제대로 다시 한 번 만들어서 combine await&async도 붙여보고 rxswift는 해봤으니

import Foundation
import ReactorKit

final class SearchReactor:Reactor {
    enum Action {
        case search(String)
        case nextPage
    }
    
    enum Mutation {
        case setSearchText(String)
        case setResult(SearchResult)
        case appendResult(SearchResult)
        case setLoading(Bool)
        case onError(Error)
    }
    
    struct State {
        var searchText: String?
        var searchResult:SearchResult = SearchResult(items: [])
        var nextIndex:Int?
        var isLoading: Bool = false
        @Pulse var errorMessage:String?
    }
    
    let initialState: State = State()
    let networkClient:NetworkService
    
    init(networkClient:NetworkService = NetworkClient.shared) {
        self.networkClient = networkClient
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .search(let searchText):
            
            let getSearchResult:Observable<SearchResult> = networkClient.getResult(searchText: searchText, startIndex: 1)
            
            return Observable.concat([
                Observable.just(Mutation.setSearchText(searchText)),
                getSearchResult.take(until:self.action.filter(isSearchAction))
                    .map { Mutation.setResult($0)}
                    .catch {
                        Observable.just(Mutation.onError($0))
                    }
            ])
        case .nextPage:
            guard !self.currentState.isLoading, let nextIndex = self.currentState.nextIndex, let searchText = self.currentState.searchText else {
                return .empty()
            }
            let getSearchResult:Observable<SearchResult> = networkClient.getResult(searchText: searchText, startIndex: nextIndex)
            
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                getSearchResult.take(until:self.action.filter(isSearchAction))
                    .map { Mutation.appendResult($0)}
                    .catch {
                        Observable.just(Mutation.onError($0))
                    }
                ,
                Observable.just(Mutation.setLoading(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setSearchText(let searchText):
            newState.searchText = searchText
        case let .setResult(searchResult):
            newState.searchResult = searchResult
            newState.nextIndex = searchResult.items.isEmpty ? nil : 2
        case let .appendResult(searchResult):
            newState.searchResult.items.append(contentsOf: searchResult.items)
            if searchResult.items.isEmpty {
                newState.nextIndex = nil
            } else if let nextIndex = newState.nextIndex {
                newState.nextIndex = nextIndex + 1
            }
        case .setLoading(let isLoading):
            newState.isLoading = isLoading
        case .onError(let error):
            newState.errorMessage = getMessage(from: error)
        }
        
        return newState
    }
    
    private func getMessage(from error:Error) -> String {
        if let networkError = error as? NetworkError {
            return networkError.description
        }
        
        return error.localizedDescription
    }
    
    private func isSearchAction(_ action: Action) -> Bool {

        if case .search = action {
            return true
        } else {
            return false
        }
        
    }
}
