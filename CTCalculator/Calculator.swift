//
//  Calculator.swift
//  CTCalculator
//
//  Created by Chris Hansen on 6/4/14.
//  Copyright (c) 2014 Chris Hansen. All rights reserved.
//

import Foundation

class Calculator {
    var first: Double?
    
    init () {}
    
    func operate(right: Double, operator: String) -> Double? {
        if let left = first {
            switch operator {
            case "+":
                return addition(right)
            case "-":
                return subtraction(right)
            case "*":
                return multiplication(right)
            case "/":
                return division(right)
            default:
                return nil
            }
        }
        return nil
    }
    
    func addition(right: Double) -> Double {
        first = first! + right
        return first!
    }

    func subtraction(right: Double) -> Double {
        first = first! - right
        return first!
    }
    
    func multiplication(right: Double) -> Double {
        first = first! * right
        return first!
    }
    
    func division(right: Double) -> Double {
        first = first! / right
        return first!
    }
    
    func clear() {
        first = nil
    }
}

