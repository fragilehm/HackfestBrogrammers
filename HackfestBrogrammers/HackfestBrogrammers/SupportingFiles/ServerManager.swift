//
//  ServerManager.swift
//  OpenSport
//
//  Created by Sanira on 12/3/16.
//  Copyright © 2016 TimelySoft. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServerManager: HTTPRequestManager  {

    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
    func getCategories(_ completion: @escaping ([Category])-> Void, error: @escaping (String)-> Void) {
        self.get(api: Constants.Network.EndPoints.Categories, completion: { (data) in
            completion(try JSONDecoder().decode([Category].self, from: data))
        }, error: error)
    }
    func getNeedMarkers(need: String,category_id: Int, _ completion: @escaping ([Pin])-> Void, error: @escaping (String)-> Void) {
        self.get(api: "\(need)/categories/\(category_id)", completion: { (data) in
            completion(try JSONDecoder().decode([Pin].self, from: data))
        }, error: error)
    }
    func getWantMarkers(category_id: Int, _ completion: @escaping ([Pin])-> Void, error: @escaping (String)-> Void) {
        self.get(api: "\(Constants.Network.EndPoints.WantMarkers)/\(category_id)", completion: { (data) in
            completion(try JSONDecoder().decode([Pin].self, from: data))
        }, error: error)
    }

    func addMarker(marker: AddPin,_ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
        self.post(api: Constants.Network.EndPoints.Marker, parameters: marker.toDictionary(), completion: { (data) in
            completion()
        }) { (message) in
            print(message)
        }
    }

}
