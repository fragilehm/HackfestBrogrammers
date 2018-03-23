//
//  Extensions.swift
//  BishkekCourses
//
//  Created by Zyfar Bektasheov on 3/1/17.
//  Copyright © 2017 ITClinic. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    
    func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

extension String {
    
    func decode64(imageData: String) -> UIImage {
        let dataDecode:NSData = NSData(base64Encoded: imageData, options:.ignoreUnknownCharacters)!
        return UIImage(data: dataDecode as Data)!
    }

}

