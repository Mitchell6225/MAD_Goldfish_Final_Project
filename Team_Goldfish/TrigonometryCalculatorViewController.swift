//
//  TrigonometryCalculatorViewController.swift
//  Team_Goldfish
//
//  Created by Anthony Horinek on 4/12/23.
//

import UIKit
import JavaScriptCore
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
func evaluateMathExpression(_ expression: String) -> Double? {              //Allow use of evaluateScript in file
    let context = JSContext()
    let result = context?.evaluateScript(expression)
    return result?.toDouble()
}

extension JSValue {                                 //Make toDouble work by using .doubleValue
    func toDouble() -> Double? {
        return toNumber()?.doubleValue
    }
}

class TrigonometryCalculatorViewController: UIViewController {
    
    @IBOutlet weak var formulaOutput: UILabel!
    @IBOutlet weak var resultOutput: UILabel!
    var  calcStr: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the output labels to 0.
        formulaOutput.text = "0"
        resultOutput.text = "0"
        
    }
    
    @IBAction func buttonTappedLN(_ sender: Any) {
        calcStr += "Math.log"
        if(formulaOutput.text == "0"){
            formulaOutput.text = "ln"     //add the button label to the formula output
        }
        else {
            formulaOutput.text! += "ln"
                    
        }
    }
    
    // Number/Symbol button functionality.
    @IBAction func buttonTapped2(_ sender: UIButton) {
        // If the formula text shows 0, replace the text,
        // else append the text
        if (sender.titleLabel?.text == "π") {                               //For more complex items add the correct javascript function to the calcStr
            calcStr += "Math.PI"
        } else if (sender.titleLabel?.text == "^") {
            calcStr += "**"
        } else {
            calcStr += "Math." + (sender.titleLabel?.text ?? "no title")
        }
        if(formulaOutput.text == "0"){
            formulaOutput.text = sender.titleLabel?.text ?? "no title"      //add the button label to the formula output
            
        }
        else {
            formulaOutput.text! += sender.titleLabel?.text ?? "no title"
            
        }
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        // If the formula text shows 0, replace the text,
        // else append the text
        if(formulaOutput.text == "0"){
            formulaOutput.text = sender.titleLabel?.text ?? "no title"          //This adds all numbers and bisc functions to both the formula output and the calcStr
            calcStr += sender.titleLabel?.text ?? "no title"
        }
        else {
            formulaOutput.text! += sender.titleLabel?.text ?? "no title"
            calcStr += sender.titleLabel?.text ?? "no title"
        }
    }
    
    
    // Backspace button functionality.
    @IBAction func backTapped(_ sender: Any) {
        // If the formula has more that 1 char, remove the last char.
        // Else assign it 0.
        var pi = false
        var log = true
        var ln = false
        var formulaStr = formulaOutput.text
        if (calcStr.last == "n" || calcStr.last == "s" || calcStr.last == "g" || calcStr.last == "t" || calcStr.last == "I" || calcStr.last == "0") {      //If the user backs up any of the more complicated items this will erase the whole item from both formulaOutput and calcStr
            var count = 0
            if (calcStr.last == "0" && calcStr[calcStr.count - 3] != "g") {
                formulaStr!.removeLast()
                log = false
            }
            if (calcStr.last == "g") {
                ln = true
            }
            if log {
                if (calcStr.last == "I") {
                    pi = true
                }
                var before = true
                while (calcStr.last != "M") {
                    if calcStr.last != "." && before {
                        count += 1
                    } else {
                        before = false
                    }
                    calcStr.removeLast()
                }
                if pi{
                    count = 1
                } else if (ln){
                    count = 2
                }
                for _ in 1...count {
                    formulaStr!.removeLast()
                }
                        
            }
            formulaOutput.text = formulaStr
            calcStr.removeLast()
        } else if (formulaStr!.last == "^"){
            formulaStr!.removeLast()
            formulaOutput.text = formulaStr
            calcStr.removeLast()
            calcStr.removeLast()
        } else if(formulaStr!.count > 1){
            formulaStr!.removeLast()
            calcStr.removeLast()
            formulaOutput.text = formulaStr
        }
        else {
            formulaOutput.text = "0"
            if calcStr != "" {
                calcStr.removeLast()
            }
        }
        if (formulaStr == "") {
            formulaOutput.text = "0"
        }
    }
    
    // Clear the result and formula label.
    @IBAction func clearTapped(_ sender: Any) {
        formulaOutput.text = "0"
        resultOutput.text = "0"
        calcStr = ""
    }
    
    // Evaluate the formula.
    @IBAction func evaluateTapped(_ sender: Any) {
        let result = evaluateMathExpression(calcStr)            //Calculate the answer to the formula output and input to result output
        resultOutput.text = String(format: "%f", result!)
       
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
