//
//  PostModel.swift
//  VanillaSample
//
//  Created by JK on 12/07/19.
//  Copyright © 2019 Jai Krishnan. All rights reserved.
//

import Foundation

class PostModel: Decodable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}
