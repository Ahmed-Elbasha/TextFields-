//
//  CashTextFieldDelegate.swift
//  TextFields
//
//  Created by Ahmed Elbasha on 7/5/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = "0"
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField.text == "0" {
            return false
        } else {
            return true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        let floatingNumber : NSNumber = (Float(newText as String)! as? NSNumber)!
        let numberFormatter = NumberFormatter()
        numberFormatter.positiveFormat = "###0.#"
        let stringFormattedFloatNumber = numberFormatter.string(from: floatingNumber)
        textField.text = stringFormattedFloatNumber
        return true
    }
    
}
