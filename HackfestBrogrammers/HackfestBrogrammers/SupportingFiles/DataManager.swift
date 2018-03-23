//
//  DataManager.swift
//  AUCA-SSC
//
//  Created by Admin on 8/18/17.
//  Copyright © 2017 NeoBis. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class DataManager {
    
    var uDefaults = UserDefaults.standard
    class var shared: DataManager {
        struct Static {
            static let instance = DataManager()
        }
        return Static.instance
    }
    
}
