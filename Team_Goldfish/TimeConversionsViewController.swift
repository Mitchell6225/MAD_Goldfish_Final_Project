//
//  TimeConversionsViewController.swift
//  Team_Goldfish
//
//  Created by Anthony Horinek on 4/12/23.
//

import UIKit

class TimeConversionsViewController: UIViewController {

    // Text Fields
    @IBOutlet weak var unitTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    // Labels
    @IBOutlet weak var seconds: UILabel!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var weeks: UILabel!
    @IBOutlet weak var months: UILabel!
    @IBOutlet weak var years: UILabel!
    @IBOutlet weak var decades: UILabel!
    @IBOutlet weak var centurys: UILabel!
    
    // Input variables
    var quantity: Double = 0.0
    var tempQuantity: Double = 0.0
    var units: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        unitTextField.delegate = self
        quantityTextField.delegate = self
        
        seconds.text = "\(quantity)"
        minutes.text = "\(quantity)"
        hours.text = "\(quantity)"
        days.text = "\(quantity)"
        weeks.text = "\(quantity)"
        months.text = "\(quantity)"
        years.text = "\(quantity)"
        decades.text = "\(quantity)"
        centurys.text = "\(quantity)"
    }
    
}


extension TimeConversionsViewController: UITextFieldDelegate{
    // Delegate method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        if textField == quantityTextField{
            let allowedcharacters = "0123456789."
            let allowedcharactersSet = CharacterSet(charactersIn: allowedcharacters)
            let typedCharactersetIn = CharacterSet(charactersIn: string)
            let numbers = allowedcharactersSet.isSuperset(of: typedCharactersetIn)
            
            return numbers
        }
        
        if textField == unitTextField{
            let allowedcharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "
            let allowedcharactersSet = CharacterSet(charactersIn: allowedcharacters)
            let typedCharactersetIn = CharacterSet(charactersIn: string)
            let letters = allowedcharactersSet.isSuperset(of: typedCharactersetIn)
            
            return letters
        }
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        unitTextField.resignFirstResponder()
        quantityTextField.resignFirstResponder()
        
        quantity = quantityTextField.text!.toDouble() ?? 0.0
        tempQuantity = quantity
        units = unitTextField.text ?? "m"
        
        checkUnits(inputUnits: units)
        
        seconds.text = "\(tempQuantity)"
        minutes.text = "\(tempQuantity / 60)"
        hours.text = "\(tempQuantity / 3600)"
        days.text = "\(tempQuantity / 86400)"
        weeks.text = "\(tempQuantity / 604800)"
        months.text = "\(tempQuantity / (86400 * 30))"
        years.text = "\(tempQuantity / (86400 * 365))"
        decades.text = "\(tempQuantity / ((86400 * 365) * 10))"
        centurys.text = "\(tempQuantity / ((86400 * 365) * 100))"


        return true
    }
    
    func checkUnits(inputUnits: String){
        switch inputUnits{
            // Metric
        case "Minutes" : // Minutes
            tempQuantity = quantity * 60
        case "Hours":
            tempQuantity = quantity * 3600
        case "Days": // Minutes
            tempQuantity = quantity * 86400
        case "Weeks":
            tempQuantity = quantity * 604800
        case "Months": // Minutes
            tempQuantity = quantity * (86400 * 30)
        case "Years":
            tempQuantity = quantity * (86400 * 365)
        case "Decades": // Minutes
            tempQuantity = quantity * ((86400 * 365) * 10)
        case "Centurys":
            tempQuantity = quantity * ((86400 * 365) * 100)

            // Base unit of seconds
        default:
            tempQuantity = quantity * 1
        }
    }
}
