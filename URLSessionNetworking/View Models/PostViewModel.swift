//
//  PostViewModel.swift
//  URLSessionNetworking
//
//  Created by ST-iOS on 6/29/22.
//

import Foundation

extension PostViewModel {
    class Callback {
        var didFetchPosts: ([Post])-> Void = { _ in }
        var didFailed: (String)-> Void = { _ in }
    }
}

class PostViewModel {
    let callback = Callback()
    
    func fetch() {
        PostAPIClient.fetchPosts {[weak self] result in
            switch result {
            case .success(let posts):
                self?.callback.didFetchPosts(posts)
            case .failure(let error):
                self?.callback.didFailed(error.description)
            }
        }
    }
}
