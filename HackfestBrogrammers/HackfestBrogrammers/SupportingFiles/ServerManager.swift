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
    func getMarkersByCategory(category_id: Int, _ completion: @escaping ([Pin])-> Void, error: @escaping (String)-> Void) {
        self.get(api: "\(Constants.Network.EndPoints.Categories)/\(category_id)", completion: { (data) in
            completion(try JSONDecoder().decode([Pin].self, from: data))
        }, error: error)
    }
//
//    func addStories(story: Story,_ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
//        self.post(api: "stories/", parameters: story.getDict(), completion: { (json) in
//            completion()
//        }) { (message) in
//            print(message)
//        }
//    }
//
//    func getAllCategories(_ completion: @escaping (Categories)-> Void, error: @escaping (String)-> Void) {
//        self.get(api: "categories", completion: { (json) in
//            completion(Categories(json: json))
//        }, error: error)
//    }
//
//    func getInstitutesById(id: Int, _ completion: @escaping (Institutes)-> Void, error: @escaping (String)-> Void) {
//        self.get(api: "servicesByCat/\(id)/", completion: { (json) in
//            completion(Institutes(json: json))
//        }, error: error)
//    }
//    func getArticles(_ completion: @escaping (Articles)-> Void, error: @escaping (String)-> Void) {
//        self.get(api: "infos", completion: { (json) in
//            completion(Articles(json: json))
//        }, error: error)
//    }
//    func getPins(_ completion: @escaping (Pins)-> Void, error: @escaping (String)-> Void) {
//        self.get(api: "pins", completion: { (json) in
//            completion(Pins(json: json))
//        }, error: error)
//    }
//    func addPins(pin: Pin,_ completion: @escaping ()-> Void, error: @escaping (String)-> Void) {
//        print(pin.getDict())
//        self.post(api: "pins/", parameters: pin.getDict(), completion: { (json) in
//            completion()
//        }) { (message) in
//            print(message)
//        }
//    }
//

}
