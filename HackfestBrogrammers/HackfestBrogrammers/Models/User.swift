//
//  User.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import Foundation

struct User: Decodable {
    var id: Int
    var isOrganization: Bool
    var name: String
    var surname: String?
    var username: String
    var password: String?
    var repeat_password: String?
    var description: String
    var isApproved: Bool?
    var addresses: [Address]?
    var contacts: [Contact]
}
