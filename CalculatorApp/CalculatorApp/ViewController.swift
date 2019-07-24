//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Aashwatth Agarwal on 7/10/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var DisplayOnScreen:Double = 0
    var storedNumber:Double = 0
    var performingOperations = false
    var operations = 0

    @IBOutlet weak var Display: UILabel!
    
    @IBAction func numPad(_ sender: UIButton) {
        if performingOperations == true {
            Display.text = String(sender.tag - 1)
            DisplayOnScreen = Double(Display.text!)!
            performingOperations = false
        }
        else {
        Display.text = Display.text! + String(sender.tag - 1)
        DisplayOnScreen = Double(Display.text!)!
    }
    }
    
    @IBAction func functionPad(_ sender: UIButton) {
        if Display.text != "" && sender.tag != 15 && sender.tag != 16
        {
            storedNumber = Double(Display.text!)!
            if sender.tag == 11 {
                Display.text = "+"
            }
            else if sender.tag == 12 {
                Display.text = "-"
            }
            else if sender.tag == 13 {
                Display.text = "*"
            }
            else if sender.tag == 14 {
                Display.text = "/"
            }
            
            operations = sender.tag
            performingOperations = true
        }
        else if sender.tag == 15
        {
            if operations == 11 {
                Display.text = String(storedNumber + DisplayOnScreen)
            }
            else if operations == 12 {
                Display.text = String(storedNumber - DisplayOnScreen)
            }
            else if operations == 13 {
                Display.text = String(storedNumber * DisplayOnScreen)
            }
            else if operations == 14 {
                Display.text = String(storedNumber / DisplayOnScreen)
            }
        }
        else if sender.tag == 16 {
            Display.text = ""
            storedNumber = 0
            DisplayOnScreen = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
