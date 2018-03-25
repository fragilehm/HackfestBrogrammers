//
//  Category.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import Foundation
struct Category: Decodable {
    var id: Int
    var title: String
    var image_url: String?
    var description: String?
}
