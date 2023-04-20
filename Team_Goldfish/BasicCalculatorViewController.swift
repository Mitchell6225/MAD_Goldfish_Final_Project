//
//  BasicCalculatorViewController.swift
//  Team_Goldfish
//
//  Created by Anthony Horinek on 4/12/23.
//

import UIKit

class BasicCalculatorViewController: UIViewController {
    
    @IBOutlet weak var formulaOutput: UILabel!
    @IBOutlet weak var resultOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the output labels to 0.
        formulaOutput.text = "0"
        resultOutput.text = "0"
    }
    
    // Number/Symbol button functionality.
    @IBAction func buttonTapped(_ sender: UIButton) {
        // If the formula text shows 0, replace the text,
        // else append the text
        if(formulaOutput.text == "0"){
            formulaOutput.text = sender.titleLabel?.text ?? "no title"
        }
        else {
            formulaOutput.text! += sender.titleLabel?.text ?? "no title"
        }
    }
    
    // Clear the result and formula label.
    @IBAction func clearTapped(_ sender: Any) {
        formulaOutput.text = "0"
        resultOutput.text = "0"
    }
    
    // TO DO: validate input, to stop program from crashing.
    
    // Evaluate the formula.
    @IBAction func evaluateTapped(_ sender: Any) {
        // Create the math expression using the formulaOutput label.
        let mathExpression: NSExpression = NSExpression(format: formulaOutput.text!)
        // Storing the result from evaluating the expression.
        let result: Double = mathExpression.expressionValue(with:nil, context: nil) as! Double
        resultOutput.text = "\(result)"
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
