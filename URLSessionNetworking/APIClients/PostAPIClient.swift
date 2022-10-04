//
//  PostAPIClient.swift
//  URLSessionNetworking
//
//  Created by ST-iOS on 6/28/22.
//

import Foundation

private struct FetchPostEndPoint: EndPoint {
    var path: String = "/posts"
}

private struct CreatePostEndPoint: EndPoint {
    let postRequest: CreatePostRequest
    
    init(postRequest: CreatePostRequest) {
        self.postRequest = postRequest
    }
    
    var path: String = "/posts"
    
    var method: HTTPMethod = .post
    
    var body: Data? {
        return try? JSONEncoder().encode(postRequest)
    }
}


enum PostAPIClient: GenericAPIClient {
    static func fetchPosts(completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        let endPoint = FetchPostEndPoint()
        startRequest(with: endPoint, completion: completion)
    }
    
    static func createPost(postRequest: CreatePostRequest,
        completion: @escaping (Result<CreatePostResponse, NetworkError>) -> Void) {
        let endPoint = CreatePostEndPoint(postRequest: postRequest)
        startRequest(with: endPoint, completion: completion)
    }
}
