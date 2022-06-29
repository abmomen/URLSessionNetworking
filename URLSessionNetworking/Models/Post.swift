//
//  Post.swift
//  URLSessionNetworking
//
//  Created by ST-iOS on 6/28/22.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct CreatePostRequest: Encodable {
    let title: String
    let body: String
    let userId: Int
}

struct CreatePostResponse: Decodable {
    let title: String
    let body: String
    let userId: Int
}
