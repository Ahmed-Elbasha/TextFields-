//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITextFieldDelegate

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var textfieldSwitch: UISwitch!

    
    // MARK: Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomColorTextFieldDelegate = RandomColorTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    
    // MARK: class states.
    var switchStatus = true
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.isHidden = true
        
        // set the switch to be off
        textfieldSwitch.isOn = true
        
        // Set the three delegates
        self.textField1.delegate = zipCodeTextFieldDelegate
        self.textField2.delegate = cashTextFieldDelegate
        self.textField3.delegate = self
    }
    
    // MARK: Text Field Delegate Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
             if switchStatus == true {
                var newText = textField.text! as NSString
                newText = newText.replacingCharacters(in: range, with: string) as NSString
                return true
             } else {
                return false
            }
        } catch is NSExpression {
            textField.text = NSException.debugDescription()
        }
        
            // Figure out what the new text will be, if we return true
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if switchStatus {
            textField.isEnabled = true
            return true
        } else {
            textField.isEnabled = false
            textField.resignFirstResponder()
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            return false
        } else {
            textField.clearButtonMode = .whileEditing
            return true
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
//        do {
//             if switchStatus == false {
//                textField.isEnabled = false
//                return true
//            } else {
//                textField.isEnabled = true
//                return false
//            }
//        } catch is NSException {
//            textField.text = NSException.debugDescription()
//        }
        return true
    }
    
    @IBAction func textfieldSwitchValueChanged(_ sender: Any) {
        if textfieldSwitch.isOn {
            textField3.isEnabled = true
            switchStatus = true
        } else {
            textField3.resignFirstResponder()
            textField3.isEnabled = false
            switchStatus = false
        }
    }
    
}

