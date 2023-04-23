//
//  VolumeConversionsViewController.swift
//  Team_Goldfish
//
//  Created by Anthony Horinek on 4/12/23.
//

import UIKit

class VolumeConversionsViewController: UIViewController {

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
    @IBOutlet weak var teaSpoon: UILabel!
    @IBOutlet weak var tableSpoon: UILabel!
    @IBOutlet weak var ounces: UILabel!
    @IBOutlet weak var cups: UILabel!
    @IBOutlet weak var pints: UILabel!
    @IBOutlet weak var quarts: UILabel!
    @IBOutlet weak var gallons: UILabel!
    @IBOutlet weak var pecks: UILabel!
    @IBOutlet weak var bushels: UILabel!
    
    // Input variables
    var quantity: Double = 0.0
    var tempQuantity: Double = 0.0
    var units: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        unitTextField.delegate = self
        quantityTextField.delegate = self
        
        mega.text = "Megaliters"
        kilo.text = "Kiloliters"
        hecto.text = "Hectoliters"
        deka.text = "Dekaliters"
        baseUnits.text = "Liters"
        deci.text = "Deciliters"
        centi.text = "Centiliters"
        milli.text = "Milliliters"
        micro.text = "Microliters"
        nano.text = "Nanoliters"
        
        teaSpoon.text = "Tea Spoons"
        tableSpoon.text = "Table Spoons"
        ounces.text = "Ounces"
        cups.text = "Cups"
        pints.text = "Pints"
        quarts.text = "Quarts"
        gallons.text = "Gallons"
        pecks.text = "Pecks"
        bushels.text = "Bushels"
    }

}


extension VolumeConversionsViewController: UITextFieldDelegate{
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
        
        teaSpoon.text = "\(tempQuantity * 202.884)"
        tableSpoon.text = "\(tempQuantity * 67.628)"
        ounces.text = "\(tempQuantity * 33.814)"
        cups.text = "\(tempQuantity * 4.16667)"
        pints.text = "\(tempQuantity * 2.11338)"
        quarts.text = "\(tempQuantity * 1.05669)"
        gallons.text = "\(tempQuantity * 0.264172)"
        pecks.text = "\(tempQuantity * 0.11351)"
        bushels.text = "\(tempQuantity * 0.0283776)"

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
        case "Teaspoon", "teaspoon", "tsp", "Tsp":
            tempQuantity = quantity * 0.00492892
        case "Tablespoon", "tablespoon", "tbsp", "Tbsp":
            tempQuantity = quantity * 0.0147868
        case "ounces", "Ounces", "ounce", "Ounce", "Oz", "oz":
            tempQuantity = quantity * 0.0295735
        case "Cups", "cups", "Cup", "cup", "C", "c.":
            tempQuantity = quantity * 0.24
        case "Pints", "pints", "Pint", "pint", "Pt", "pt":
            tempQuantity = quantity * 0.473176
        case "Quarts", "quarts", "Quart", "quart", "Qt", "qt":
            tempQuantity = quantity * 0.946353
        case "Gallons", "gallons", "Gallon", "gallon", "Gal", "gal":
            tempQuantity = quantity * 3.78541
        case "Pecks", "pecks", "Peck", "peck", "Pk", "pk":
            tempQuantity = quantity * 8.80977
        case "Bushels", "bushels", "Bushel", "bushel", "bsh", "Bsh", "bu", "Bu":
            tempQuantity = quantity * 35.2391
            
            // Metric Base unit liters
        default:
            tempQuantity = quantity * 1
        }
    }
}
