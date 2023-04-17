//
//  TrigonometryCalculatorViewController.swift
//  Team_Goldfish
//
//  Created by Anthony Horinek on 4/12/23.
//

import UIKit

class TrigonometryCalculatorViewController: UIViewController {

    @IBOutlet weak var formulaOutput: UILabel!
    @IBOutlet weak var resultOutput: UILabel!
    
    var formulaStr = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the output labels to 0.
        formulaOutput.text = formulaStr
        resultOutput.text = "0"
    }
    
    // Number/Symbol button functionality.
    @IBAction func buttonTapped(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "no title")
        // If the formula text shows 0, replace the text,
        // else append the text
        if(formulaStr == "0"){
            formulaStr = sender.titleLabel?.text ?? "no title"
        }
        else {
            formulaStr += sender.titleLabel?.text ?? "no title"
        }
        
        // Set the output text to the formulaStr
        formulaOutput.text = formulaStr
    }
    
    // Backspace button functionality.
    @IBAction func backTapped(_ sender: Any) {
        // If the formula has more that 1 char, remove the last char.
        // Else assign it 0.
        if(formulaStr.count > 1){
            formulaStr.removeLast()
            formulaOutput.text = formulaStr
        }
        else {
            formulaStr = "0"
            formulaOutput.text = formulaStr
        }
    }
    
    // Clear the result and formula label.
    @IBAction func clearTapped(_ sender: Any) {
        formulaStr = "0"
        formulaOutput.text = "0"
        resultOutput.text = "0"
    }
    
    // Evaluate the formula
    @IBAction func evaluateTapped(_ sender: Any) {
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
