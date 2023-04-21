//
//  WeightConversionsViewController.swift
//  Team_Goldfish
//
//  Created by Anthony Horinek on 4/12/23.
//

import UIKit

class WeightConversionsViewController: UIViewController {

    // Text Fields
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var unitTextField: UITextField!
    
    // Labels metric
    @IBOutlet weak var mega: UILabel!
    @IBOutlet weak var kilo: UILabel!
    @IBOutlet weak var hecto: UILabel!
    @IBOutlet weak var deka: UILabel!
    @IBOutlet weak var baseUnits: UILabel!
    @IBOutlet weak var deci: UILabel!
    @IBOutlet weak var centi: UILabel!
    @IBOutlet weak var milli: UILabel!
    @IBOutlet weak var micro: UILabel!
    @IBOutlet weak var nano: UILabel!
    
    // Labels English
    @IBOutlet weak var ounces: UILabel!
    @IBOutlet weak var pounds: UILabel!
    @IBOutlet weak var hwUS: UILabel!
    @IBOutlet weak var hwUK: UILabel!
    @IBOutlet weak var tonUS: UILabel!
    @IBOutlet weak var tonUK: UILabel!
    
    // Input variables
    var quantity: Double = 0.0
    var tempQuantity: Double = 0.0
    var units: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        unitTextField.delegate = self
        quantityTextField.delegate = self
        
        mega.text = "\(quantity)"
        kilo.text = "\(quantity)"
        hecto.text = "\(quantity)"
        deka.text = "\(quantity)"
        baseUnits.text = "\(quantity)"
        deci.text = "\(quantity)"
        centi.text = "\(quantity)"
        milli.text = "\(quantity)"
        micro.text = "\(quantity)"
        nano.text = "\(quantity)"

        ounces.text = "\(quantity)"
        pounds.text = "\(quantity)"
        hwUS.text = "\(quantity)"
        hwUK.text = "\(quantity)"
        tonUS.text = "\(quantity)"
        tonUK.text = "\(quantity)"
    }

}


extension WeightConversionsViewController: UITextFieldDelegate{
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
        
        mega.text = "\(tempQuantity * 0.000001)"
        kilo.text = "\(tempQuantity * 0.001)"
        hecto.text = "\(tempQuantity * 0.01)"
        deka.text = "\(tempQuantity * 0.1)"
        baseUnits.text = "\(tempQuantity)"
        deci.text = "\(tempQuantity * 10)"
        centi.text = "\(tempQuantity * 100)"
        milli.text = "\(tempQuantity * 1000)"
        micro.text = "\(tempQuantity * 1000000)"
        nano.text = "\(tempQuantity * 1000000000)"

        ounces.text = "\(tempQuantity * 0.035274)"
        pounds.text = "\(tempQuantity * 0.00220462)"
        hwUS.text = "\(tempQuantity * 0.0000220462)"
        hwUK.text = "\(tempQuantity * 0.0000196841)"
        tonUS.text = "\(tempQuantity * 0.0000011023)"
        tonUK.text = "\(tempQuantity * 0.00000098421)"

        return true
    }
    
    func checkUnits(inputUnits: String){
        switch inputUnits{
            // Metric
        case "M", "Mm", "Mega Liters", "Mega liters", "mega liters" : //Mega liters
            tempQuantity = quantity * 1000000
        case "k", "km", "Kilo Liters", "Kilo liters", "kilo liters" : // Kilo liters
            tempQuantity = quantity * 1000
        case "h", "hm", "Hecto Liters", "Hecto liters", "hecto liters" : // Hecto liters
            tempQuantity = quantity * 100
        case "da", "dam", "Deka Liters", "Deka liters", "deka liters" : // Deca liters
            tempQuantity = quantity * 10
        case "d", "dm", "Deci Liters", "Deci liters", "deci liters" : // deci liters
            tempQuantity = quantity * 0.1
        case "c", "cm", "Centi Liters", "Centi liters", "centi liters" : // centi liters
            tempQuantity = quantity * 0.01
        case "m", "mm", "Milli Liters", "Milli liters", "milli liters" : // milli liters
            tempQuantity = quantity * 0.001
        case "u", "um", "Micro Liters", "Micro liters", "micro liters" : // micro liters
            tempQuantity = quantity * 0.000001
        case "n", "nm", "Nano Liters", "Nano liters", "nano liters" : // nano liters
            tempQuantity = quantity * 0.000000001
            
            // English units
        case "ounces", "Ounces", "ounce", "Ounce", "Oz", "oz":
            tempQuantity = quantity * 28.3495
        case "Pounds", "pounds", "Pound", "pound", "lb", "Lb":
            tempQuantity = quantity * 453.592
        case "hwUS", "Hundred Wieght US", "Hundred wieght US", "hundred wieght US", "hundred wieght us":
            tempQuantity = quantity * 45359.237
        case "hwUK", "Hundred Wieght UK", "Hundred wieght UL", "hundred wieght UK", "hundred wieght uk":
            tempQuantity = quantity * 50802.34544
        case "tonUS", "Tons US", "Ton US", "Ton us", "Tons us", "ton us", "tons us", "ton US", "tons US":
            tempQuantity = quantity * 907185
        case "tonUK", "Tons UK", "Ton UK", "Ton uk", "Tons uk", "ton uk", "tons uk", "ton UK", "tons UK":
            tempQuantity = quantity * 1016000
            
            // Metric Base unit liters
        default:
            tempQuantity = quantity * 1
        }
    }
}

