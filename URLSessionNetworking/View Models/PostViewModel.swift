//
//  PostViewModel.swift
//  URLSessionNetworking
//
//  Created by ST-iOS on 6/29/22.
//

import Foundation

extension PostViewModel {
    class Callback {
        var didFetchPosts: ()-> Void = { }
        var didFailed: (String)-> Void = { _ in }
    }
}

class PostViewModel {
    let callback = Callback()
    
    private(set) var posts = [Post]()
    
    func fetch() {
        PostAPIClient.fetchPosts {[weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                self?.callback.didFetchPosts()
            case .failure(let error):
                self?.callback.didFailed(error.description)
            }
        }
    }
}
