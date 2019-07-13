//
//  PostListController.swift
//  VanillaSample
//
//  Created by JK on 13/07/19.
//  Copyright © 2019 Jai Krishnan. All rights reserved.
//

import UIKit

enum NetworkError: Error {
    
}

class PostListController: UICollectionViewController {
    
    var posts: [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PostCollectionCell.self, forCellWithReuseIdentifier: PostCollectionCell.REUSE_ID)
        fetchPosts()
    }
    
    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        URLSession.shared.dataTask(with: url) { [weak self](data, response, err) in
            guard let data = data, let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode, err == nil else {
                return
            }
            do {
                self?.posts = try JSONDecoder().decode([PostModel].self, from: data)
                print(self?.posts[0].body)
            } catch let err {
                print("Error", err.localizedDescription)
            }
        }
    }
}
