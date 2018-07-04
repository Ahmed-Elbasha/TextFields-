//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func getRandomColor() -> UIColor {
        let red: CGFloat = CGFloat( arc4random() % 255)
        let blue: CGFloat = CGFloat( arc4random() % 255)
        let green: CGFloat = CGFloat( arc4random() % 255)
        let randomColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return randomColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.clearButtonMode = .always
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        textField.textColor = getRandomColor()
        
        return true
    }
}
