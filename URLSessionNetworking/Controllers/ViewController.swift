//
//  ViewController.swift
//  URLSessionNetworking
//
//  Created by ST-iOS on 6/28/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let post = CreatePostRequest(title: "title", body: "my post body", userId: 333)
        PostAPIClient.createPost(postRequest: post) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.description)
            }
        }
    }


}

