//
//  ViewController.swift
//  Calculator
//
//  Created by 김승현 on 2017. 1. 1..
//  Copyright © 2017년 Alice Kim. All rights reserved.
//

import UIKit //module

//optional : 1 : not set (nil)
//           2 : set

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddelOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("touched \(digit) digit")
        if(userIsInTheMiddelOfTyping) {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddelOfTyping = true
    }
    
    private var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculaterBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddelOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddelOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
}

