//
//  ViewController.swift
//  URLSessionNetworking
//
//  Created by ST-iOS on 6/28/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let postViewModel = PostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        postViewModel.fetch()
        handleNetworkCallbacks()
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func handleNetworkCallbacks() {
        postViewModel.callback.didFetchPosts = {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        postViewModel.callback.didFailed = {[weak self] error in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = postViewModel.posts[indexPath.row]
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = post.title
        return cell
    }
}

