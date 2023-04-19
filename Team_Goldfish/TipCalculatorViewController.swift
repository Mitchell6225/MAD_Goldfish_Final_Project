//
//  TipCalculatorViewController.swift
//  Team_Goldfish
//
//  Created by Anthony Horinek on 4/12/23.
//

import UIKit

class TipCalculatorViewController: UIViewController {

    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var customTipTextField: UITextField!
    
    @IBOutlet weak var tip15: UILabel!
    @IBOutlet weak var tip20: UILabel!
    @IBOutlet weak var tip25: UILabel!
    @IBOutlet weak var tipCustom: UILabel!
    
    var amountSpent: Double = 0.0
    var customTip: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipTextField.delegate = self
        customTipTextField.delegate = self
        
        tip15.text = "$\(amountSpent * 0.15)"
        tip20.text = "$\(amountSpent * 0.20)"
        tip25.text = "$\(amountSpent * 0.25)"
        tipCustom.text = "$\(amountSpent * (customTip * 0.01))"
    }
    
    func formatText(currentText: String, symbol: Character) -> String{
        var currentString = currentText
        
        if !currentString.contains(symbol){
            if symbol == "%"{
                currentString.append("%")
            }
            else{
                currentString = "$" + currentText
            }
        }
        return currentString
    }
    
    func checkForSymbols(currentText: String) -> String{
        var currentString = currentText
        
        currentString = currentString.replacingOccurrences(of: "%", with: "")
        currentString = currentString.replacingOccurrences(of: "$", with: "")
        
        return currentString
    }
    
}

extension String{
    func toDouble() -> Double?{
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

extension TipCalculatorViewController: UITextFieldDelegate{
    // Delegate method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        if textField == textField{
            let allowedcharacters = "0123456789."
            let allowedcharactersSet = CharacterSet(charactersIn: allowedcharacters)
            let typedCharactersetIn = CharacterSet(charactersIn: string)
            let numbers = allowedcharactersSet.isSuperset(of: typedCharactersetIn)
            
            return numbers
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tipTextField.resignFirstResponder()
        customTipTextField.resignFirstResponder()
        
        tipTextField.text = formatText(currentText: tipTextField.text!, symbol: "$")
        customTipTextField.text = formatText(currentText: customTipTextField.text!, symbol: "%")
        
        amountSpent = checkForSymbols(currentText: tipTextField.text!).toDouble() ?? 0.0
        customTip = checkForSymbols(currentText: customTipTextField.text!).toDouble() ?? 0.0
        
        tip15.text = "$\(amountSpent * 0.15)"
        tip20.text = "$\(amountSpent * 0.20)"
        tip25.text = "$\(amountSpent * 0.25)"
        tipCustom.text = "$\(amountSpent * (customTip * 0.01))"

        return true
    }
}
