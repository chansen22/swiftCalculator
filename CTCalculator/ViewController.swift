//
//  ViewController.swift
//  CTCalculator
//
//  Created by Chris Hansen on 6/4/14.
//  Copyright (c) 2014 Chris Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let calc = Calculator()
    var clearResult = false
    var lastOperator: String?
    @IBOutlet var resultLabel : UILabel
    @IBOutlet var zeroButton : UIButton
    @IBOutlet var oneButton : UIButton
    @IBOutlet var twoButton : UIButton
    @IBOutlet var threeButton : UIButton
    @IBOutlet var fourButton : UIButton
    @IBOutlet var fiveButton : UIButton
    @IBOutlet var sixButton : UIButton
    @IBOutlet var sevenButton : UIButton
    @IBOutlet var eightButton : UIButton
    @IBOutlet var nineButton : UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateResultLabel(result: Double?) {
        if let computed = result {
            resultLabel.text = "\(computed)"
            calc.first = computed
        } else {
            resultLabel.text = "ERROR"
        }
    }
    
    @IBAction func operatorSelected(sender : UIButton) {
        if lastOperator == nil {
            lastOperator = sender.titleLabel.text
        }
        
        let currentValue = resultLabel.text.bridgeToObjectiveC().doubleValue
        if calc.first == nil {
            calc.first = currentValue
        } else {
            updateResultLabel(calc.operate(currentValue, operator: lastOperator!))
        }
        clearResult = true
        lastOperator = sender.titleLabel.text
    }
    
    @IBAction func equalSelected(sender : UIButton) {
        if let operator = lastOperator {
            updateResultLabel(calc.operate(resultLabel.text.bridgeToObjectiveC().doubleValue, operator: operator))
            lastOperator = nil
            calc.clear()
            clearResult = true
        }
    }
    
    @IBAction func numberSelected(sender : UIButton) {
        if resultLabel.text == "0" || clearResult {
            if sender.titleLabel.text == "0" {
                return
            }
            resultLabel.text = "\(sender.titleLabel.text)"
            clearResult = false
        } else {
            resultLabel.text = "\(resultLabel.text)\(sender.titleLabel.text)"
        }
    }
    
    @IBAction func clearSelected(sender : UIButton) {
        resultLabel.text = "0"
        calc.clear()
    }
    
    @IBAction func pointSelected(sender : UIButton) {
        if clearResult {
            resultLabel.text = "."
        } else if !resultLabel.text.bridgeToObjectiveC().containsString(".") {
            resultLabel.text = "\(resultLabel.text)."
        }
    }
    
    @IBAction func positiveNegativeSelected(sender : UIButton) {
        if resultLabel.text.hasPrefix("-") {
            resultLabel.text = resultLabel.text.bridgeToObjectiveC().stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch, range: NSRange(location: 0, length: 1))
        } else {
            resultLabel.text = "-\(resultLabel.text)"
        }
    }
}

