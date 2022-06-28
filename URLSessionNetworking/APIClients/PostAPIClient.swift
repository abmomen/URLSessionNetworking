//
//  PostAPIClient.swift
//  URLSessionNetworking
//
//  Created by ST-iOS on 6/28/22.
//

import Foundation

private struct FetchPostEndPoint: EndPoint {
    var path: String = "post"
}

private struct CreatePostEndPoint: EndPoint {
    let postRequest: CreatePostRequest
    
    init(postRequest: CreatePostRequest) {
        self.postRequest = postRequest
    }
    
    var path: String = "posts"
    
    var method: HTTPMethod = .post
    
    var body: Data? {
        return try? JSONEncoder().encode(postRequest)
    }
}


enum PostAPIClient: GenericAPIClient {
    static func fetchPosts(completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        let request = FetchPostEndPoint()
        startRequest(with: request.request, completion: completion)
    }
    
    static func createPost(
        postRequest: CreatePostRequest,
        completion: @escaping (Result<CreatePostResponse, NetworkError>) -> Void) {
        let req = CreatePostEndPoint(postRequest: postRequest)
        startRequest(with: req.request, completion: completion)
    }
}
