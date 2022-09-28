//
//  FeedAdapter.swift
//  App
//
//  Created by Lorenzo Limoli on 28/09/22.
//


import Feed
import API

class FeedAdapter: FeedProtocol{
    
    private let _apiClient = APIClient.shared
    
    func fetchFeeds(completion: @escaping ([String]) -> Void) {
        _apiClient.execute(request: URLRequest(url: URL(string: "https://helloworld.com")!)) { _ in
            completion([
                "Feed1",
                "Feed2",
                "Feed3",
                "Feed4",
            ])
        }
    }
}
