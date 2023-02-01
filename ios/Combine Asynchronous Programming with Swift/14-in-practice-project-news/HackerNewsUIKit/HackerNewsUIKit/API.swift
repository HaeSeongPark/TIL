//
//  API.swift
//  HackerNewsUIKit
//
//  Created by rhino Q on 2023/02/01.
//

import Foundation
import Combine
struct API {
    /// API Errors.
    enum Error: LocalizedError {
        case addressUnreachable(URL)
        case invalidResponse
        
        var errorDescription: String? {
            switch self {
            case .invalidResponse: return "The server responded with garbage."
            case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
            }
        }
    }
    
    /// API endpoints.
    enum EndPoint {
        static let baseURL = URL(string: "https://hacker-news.firebaseio.com/v0/")!
        
        case stories
        case story(Int)
        
        var url: URL {
            switch self {
            case .stories:
                return EndPoint.baseURL.appendingPathComponent("newstories.json")
            case .story(let id):
                return EndPoint.baseURL.appendingPathComponent("item/\(id).json")
            }
        }
    }
    
    /// Maximum number of stories to fetch (reduce for lower API strain during development).
    var maxStories = 10
    
    /// A shared JSON decoder to use in calls.
    private let decoder = JSONDecoder()
    
    private let apiQueue = DispatchQueue(label: "API", qos: .default, attributes: .concurrent)
    
    // Add your API code here
    func story(id:Int) -> AnyPublisher<Story,Error> {
        URLSession.shared
            .dataTaskPublisher(for: EndPoint.story(id).url)
            .receive(on: apiQueue)
            .map(\.data)
            .decode(type: Story.self, decoder: decoder)
            .catch { _ in Empty<Story, Error>() }
            .eraseToAnyPublisher()
    }
    
    func mergedStories(ids storyIds:[Int]) -> AnyPublisher<Story, Error> {
        let storyIds = Array(storyIds.prefix(maxStories))
        precondition(!storyIds.isEmpty)
        
        let initialpublisher = story(id:storyIds[0])
        let remainder = Array(storyIds.dropFirst())
        
        return remainder.reduce(initialpublisher) { combined, id in
            return combined
                .merge(with:story(id:id))
                .eraseToAnyPublisher()
        }
    }
    
    func stories() -> AnyPublisher<[Story],Error> {
        URLSession.shared
            .dataTaskPublisher(for: EndPoint.stories.url)
            .map(\.data)
            .decode(type:[Int].self, decoder:decoder)
            .mapError { error -> API.Error in
                switch error {
                case  is URLError:
                    return Error.addressUnreachable(EndPoint.stories.url)
                default:
                    return Error.invalidResponse
                }
            }
            .filter { !$0.isEmpty }
            .flatMap { storyIds in
                return self.mergedStories(ids:storyIds)
            }
            .scan([]) { stories, story -> [Story] in
                return stories + [story]
            }
            .map { $0.sorted() }
            .eraseToAnyPublisher()
    }
}
