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
        
        seconds.text = "Seconds"
        minutes.text = "Minutes"
        hours.text = "Hours"
        days.text = "Days"
        weeks.text = "Weeks"
        months.text = "Months"
        years.text = "Years"
        decades.text = "Decades"
        centurys.text = "Centurys"
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
        case "Minutes" , "minutes", "Minute", "minute", "min", "Min", "M", "m": // Minutes
            tempQuantity = quantity * 60
        case "Hours", "Hour", "hours", "hour", "hr", "Hr":
            tempQuantity = quantity * 3600
        case "Days", "days", "day", "Day", "D", "d": // Minutes
            tempQuantity = quantity * 86400
        case "Weeks", "weeks", "Week", "week", "Wk", "wk":
            tempQuantity = quantity * 604800
        case "Months", "months", "Month", "month", "Mo", "mo": // Minutes
            tempQuantity = quantity * (86400 * 30)
        case "Years", "years", "Year", "year", "Yr", "yr":
            tempQuantity = quantity * (86400 * 365)
        case "Decades", "decades", "Decade", "decade": // Minutes
            tempQuantity = quantity * ((86400 * 365) * 10)
        case "Centurys", "centurys", "Century", "centruy", "c", "C":
            tempQuantity = quantity * ((86400 * 365) * 100)

            // Base unit of seconds
        default:
            tempQuantity = quantity * 1
        }
    }
}
