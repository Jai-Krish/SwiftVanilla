//
//  ViewController.swift
//  VanillaSample
//
//  Created by JK on 12/07/19.
//  Copyright © 2019 Jai Krishnan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let postView = PostByIdView()
    
    override func loadView() {
        super.loadView()
        view = postView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        setupInteraction()
    }
    
    func setupInteraction() {
        postView.fetchBtn.addTarget(self, action: #selector(onFetchTap), for: .touchUpInside)
    }
    
    @objc func onFetchTap() {
        guard let postId = postView.postIdTextField.text, let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)") else {
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self](data, response, err) in
            do {
                guard let data = data, let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode, err == nil  else {
                    throw RequestError.RequestFailed
                }
                let post  = try JSONDecoder().decode(PostModel.self, from: data)
                print("Response", post.body ?? "nil")
                DispatchQueue.main.async {
                    self?.postView.postBody.text = post.body
                }
            } catch let err {
                print("Error", err)
            }
        }.resume()
    }
}

enum RequestError: Error {
    case RequestFailed
}
