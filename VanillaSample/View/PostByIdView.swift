//
//  PostByIdView.swift
//  VanillaSample
//
//  Created by JK on 12/07/19.
//  Copyright © 2019 Jai Krishnan. All rights reserved.
//

import UIKit

class PostByIdView: UIView {
    
    let postIdTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .white
        field.placeholder = "Post Id"
        field.textAlignment = .center
        field.text = "1"
        return field
    }()
    
    let fetchBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Fetch", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let allPostsBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("All Posts", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let postBody: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(postIdTextField)
        addSubview(fetchBtn)
        addSubview(postBody)
        addSubview(allPostsBtn)
        setupViews()
    }
    
    func setupViews() {
        postIdTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        postIdTextField.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        postIdTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        postIdTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        postIdTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fetchBtn.topAnchor.constraint(equalTo: postIdTextField.bottomAnchor, constant: 10).isActive = true
        fetchBtn.heightAnchor.constraint(equalToConstant: 40)
        fetchBtn.centerXAnchor.constraint(equalTo: postIdTextField.centerXAnchor).isActive = true
        
        allPostsBtn.topAnchor.constraint(equalTo: fetchBtn.bottomAnchor, constant: 40).isActive = true
        allPostsBtn.centerXAnchor.constraint(equalTo: fetchBtn.centerXAnchor).isActive = true
        
        postBody.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        postBody.bottomAnchor.constraint(equalTo: postIdTextField.topAnchor).isActive = true
        postBody.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        postBody.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
