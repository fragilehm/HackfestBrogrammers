//
//  Pin.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import Foundation
struct Pin: Decodable {
    var id: Int?
    var categories: [Category]
    var status: String
    var description: String
    var address: String
    var latitude: String
    var longitude: String
    var isNeed: Bool?
    var user_id: Int?
    var user_phone: String?
    var user_email: String?
    var user_name: String?
    var user_surname: String?
    var user_description: String?
    var user_image_url: String?
    var user_connectedTo: String?
}
