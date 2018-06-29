//
//  ViewController.swift
//  Calculator3
//
//  Created by 탁은주 on 2018. 4. 10..
//  Copyright © 2018년 TEJ. All rights reserved.
//

import UIKit

enum Operation:String{
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
    }
    @IBAction func numberPressedAction(_ sender: RoundButton) {
        if runningNumber.count <= 8{
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }
    @IBAction func allClearPressedAction(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    @IBAction func dotPressedAction(_ sender: RoundButton) {
        if runningNumber.count <= 7{
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    @IBAction func dividePressedAction(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    @IBAction func multiplyPressedAction(_ sender: RoundButton) {
        if outputLabel.text == rightValue {
            outputLabel.text = result
        }
        operation(operation: .Multiply)
    }
    @IBAction func subtractPressedAction(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    @IBAction func addPressedAction(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func equalPressedAction(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    
    
    func operation(operation:Operation){
        if currentOperation != .NULL{
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add{
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subtract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    
                }else if currentOperation == .Divide{
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                    
                }else if currentOperation == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation = operation
            
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}


