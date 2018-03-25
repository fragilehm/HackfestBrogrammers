//
//  Pin.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import Foundation
struct AddPin: Decodable {
    var categories: [Int]
    var status: String
    var description: String
    var address: String?
    var latitude: Double?
    var longitude: Double?
    var isNeed: Bool
    var user_id: Int?
    var user_phone: String?
    var user_email: String?
    var user_name: String?
    var user_surname: String?
    var user_description: String?
    var user_image_url: String?
    var user_connectedTo: String?
    
    func toDictionary() -> [String:Any]{
        return [
                "categories": categories,
                "status": status,
                "description": description,
                "address": address ?? "",
                "latitude": latitude ?? "",
                "longitude": longitude ?? "",
                "isNeed": isNeed,
                "user_id":user_id ?? "",
                "user_phone": user_phone ?? "",
                "user_email": user_email ?? "",
                "user_name": user_name ?? "",
                "user_surname": user_surname ?? "",
                "user_description": user_description ?? "",
                "user_image_url": user_image_url ?? "",
                "user_connectedTo": user_connectedTo ?? ""]
    }
}

