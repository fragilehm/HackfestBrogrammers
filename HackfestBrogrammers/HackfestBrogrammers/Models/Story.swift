//
//  Story.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import Foundation
struct Story: Decodable {
    var id: Int
    var user: Int
    var description: String
    var image_url: String
    var updated: String
}
