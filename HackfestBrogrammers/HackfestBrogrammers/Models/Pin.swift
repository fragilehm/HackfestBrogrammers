//
//  Pin.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import Foundation
struct Pin: Decodable {
    var id: Int
    var categories: [SimpleCategory]
    var user_image_url: String?
    var status: String
    var description: String

//    var latitude: Double?
//    var longitude: Double?
//    var address: String?
//    var isNeed: String?
//    var name: String?
//    var surname: String?
//    var username: String?
//    var user_description: String?
}
