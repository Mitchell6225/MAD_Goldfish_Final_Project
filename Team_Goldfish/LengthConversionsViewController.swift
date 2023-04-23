//
//  LengthConversionsViewController.swift
//  Team_Goldfish
//
//  Created by Anthony Horinek on 4/12/23.
//

import UIKit

class LengthConversionsViewController: UIViewController {

    // Text Fields
    @IBOutlet weak var unitTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
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
    @IBOutlet weak var inches: UILabel!
    @IBOutlet weak var feet: UILabel!
    @IBOutlet weak var yards: UILabel!
    @IBOutlet weak var rods: UILabel!
    @IBOutlet weak var chains: UILabel!
    @IBOutlet weak var furlongs: UILabel!
    @IBOutlet weak var miles: UILabel!
    @IBOutlet weak var nauticalMiles: UILabel!
    
    // Input variables
    var quantity: Double = 0.0
    var tempQuantity: Double = 0.0
    var units: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        unitTextField.delegate = self
        quantityTextField.delegate = self
        
        mega.text = "Megameters"
        kilo.text = "Kilometers"
        hecto.text = "Hectometers"
        deka.text = "Dekameters"
        baseUnits.text = "Meters"
        deci.text = "Decimeters"
        centi.text = "Centimeter"
        milli.text = "Millimeter"
        micro.text = "Micrometer"
        nano.text = "Nanometer"
        
        inches.text = "Inches"
        feet.text = "Feet"
        yards.text = "Yards"
        rods.text = "Rods"
        chains.text = "Chains"
        furlongs.text = "Furlongs"
        miles.text = "Miles"
        nauticalMiles.text = "Nautical Miles"
    }
    

}


extension LengthConversionsViewController: UITextFieldDelegate{
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
        
        inches.text = "\(tempQuantity * 39.3701)"
        feet.text = "\(tempQuantity * 3.28084)"
        yards.text = "\(tempQuantity * 1.09361)"
        rods.text = "\(tempQuantity * 0.198839)"
        chains.text = "\(tempQuantity * 0.0497097)"
        furlongs.text = "\(tempQuantity * 0.00497096)"
        miles.text = "\(tempQuantity * 0.000621371)"
        nauticalMiles.text = "\(tempQuantity * 0.000539957)"

        return true
    }
    
    func checkUnits(inputUnits: String){
        switch inputUnits{
            // Metric
        case "M", "Mm", "Mega Meters", "Mega meters", "mega meters" : //Mega meters
            tempQuantity = quantity * 1000000
        case "k", "km", "Kilo Meters", "Kilo meters", "kilo meters" : // Kilo meters
            tempQuantity = quantity * 1000
        case "h", "hm", "Hecto Meters", "Hecto meters", "hecto meters" : // Hecto meters
            tempQuantity = quantity * 100
        case "da", "dam", "Deka Meters", "Deka meters", "deka meters" : // Deca meters
            tempQuantity = quantity * 10
        case "d", "dm", "Deci Meters", "Deci meters", "deci meters" : // deci meters
            tempQuantity = quantity * 0.1
        case "c", "cm", "Centi Meters", "Centi meters", "centi meters" : // centi meters
            tempQuantity = quantity * 0.01
        case "mm", "Milli Meters", "Milli meters", "milli meters" : // milli meters
            tempQuantity = quantity * 0.001
        case "u", "um", "Micro Meters", "Micro meters", "micro meters" : // micro meters
            tempQuantity = quantity * 0.000001
        case "n", "nm", "Nano Meters", "Nano meters", "nano meters" : // nano meters
            tempQuantity = quantity * 0.000000001
            
            // English units
        case "in", "Inch", "inch", "Inches", "inches": // inches
            tempQuantity = quantity * 0.0254
        case "ft", "Feet", "feet", "Foot", "foot": // feet
            tempQuantity = quantity * 0.3048
        case "yd", "Yard", "yard", "Yards", "yards": // yards
            tempQuantity = quantity * 0.9144
        case "rod", "Rod", "rods", "Rods": // rods
            tempQuantity = quantity * 5.0292
        case "chain", "Chain", "chains", "Chains": // chains
            tempQuantity = quantity * 20.1168
        case "furlong", "Fulong", "furlongs", "Furlongs": // furlongs
            tempQuantity = quantity * 201.168
        case "mi", "Mile", "mile", "Miles", "miles": // miles
            tempQuantity = quantity * 1609.34
        case "NM", "Nautical Mile", "Nautical mile", "nautical mile", "Nautical Miles", "Nautical miles", "nautical miles": // nautical miles
            tempQuantity = quantity * 1852
            
            // Metric Base unit meters
        default:
            tempQuantity = quantity * 1
        }
    }
}
