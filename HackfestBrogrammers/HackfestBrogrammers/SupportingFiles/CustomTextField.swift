//
//  CustomTextField.swift
//  HackfestBrogrammers
//
//  Created by isi on 3/25/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//
import UIKit

class CustomTextField: UITextField {
    var padding: CGFloat = 4
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     UIEdgeInsetsMake(0, padding, 0, padding))
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     UIEdgeInsetsMake(0, padding, 0, padding))
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds,
                                     UIEdgeInsetsMake(0, padding, 0, padding))
    }
}
