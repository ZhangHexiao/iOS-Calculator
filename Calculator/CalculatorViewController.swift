//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    
    enum OperatorType: String {
        case addition = "+"
        case subtraction = "-"
        case multiplication = "×"
        case division = "÷"
    }
    
    //    func addOperandDigit(_ digit: String) -> String {
    //
    //    }
    //
    
    func setOperator(_ operatorString: String) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if operatorType == nil{
            operand2String = ""
        }
        
        operand1String = operand1String + (sender.titleLabel?.text)!
        outputLabel.text = operand1String
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if operand2String == "" {
            operand2String = operand1String
            operand1String = ""
        }
        
        if operand1String != "" && operand2String != ""{
            doCalculation()
        }
        switch sender.titleLabel?.text {
        case "+" : self.operatorType = .addition
        case "-" : self.operatorType = .subtraction
        case "×" : self.operatorType = .multiplication
        case "÷" : self.operatorType = .division
        default: self.operatorType = nil
        }
//        print("operator" + self.operatorType!.rawValue ?? "not defined")
//        print(operand1String + "  " + operand2String)
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        doCalculation()
        operatorType = nil
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        operand2String = ""
        operand1String = ""
        operatorType = nil
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
        
    }
    
    private func doCalculation() {
        let number1 = Double(operand1String) ?? 0
        let number2 = Double(operand2String) ?? 0
        var temp = 0.0
        switch self.operatorType {
        case .addition : temp = number1 + number2
        case .subtraction : temp =  number2 - number1
        case .multiplication: temp =  number2 * number1
        case .division : temp =  number2 / number1
        default: print("No operator")
        }
        outputLabel.text = String(temp)
        operand2String = String(temp)
        operand1String = ""
        print("is string stored"+operand2String)
    }
    
    
}
