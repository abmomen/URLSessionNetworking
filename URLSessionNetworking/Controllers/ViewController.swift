//
//  ViewController.swift
//  URLSessionNetworking
//
//  Created by ST-iOS on 6/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    let postViewModel = PostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        postViewModel.fetch()
        
        handleNetworkCallbacks()
    }
    
    private func handleNetworkCallbacks() {
        postViewModel.callback.didFetchPosts = {[weak self] posts in
            print(posts)
        }
        
        postViewModel.callback.didFailed = {[weak self] error in
            print(error)
        }
    }
}

