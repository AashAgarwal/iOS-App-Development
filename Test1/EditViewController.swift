//
//  EditViewController.swift
//  Test1
//
//  Created by Aashwatth Agarwal on 7/14/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate {
    func update(to newValue: String)
}

class EditViewController: UIViewController {
    
    
    @IBOutlet weak var controlLabel: UILabel!
    
    @IBOutlet weak var switchingControl: UISwitch!
    
    @IBOutlet weak var textEditor: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var sliderControl: UISlider!
    
    @IBOutlet weak var stepperFunction: UIStepper!
    
    @IBOutlet weak var currentValue: UILabel!
    
    var stringToEdit: String?
    var delegate: EditViewControllerDelegate?
    var value: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controlLabel.text = stringToEdit
        
        if  let index = stringToEdit?.firstIndex(of: ":") {
            controlLabel.text = String((stringToEdit?.prefix(upTo: index))!)
            
            let skipColonSpace = stringToEdit?.index(index, offsetBy: 2)
            
            value = String(((stringToEdit?.suffix(from: skipColonSpace!))!))
            currentValue.text = "Current Value: \(value!)"
            
            switch controlLabel.text {
            case "switchingControl":
                switchingControl.isHidden = false
                textEditor.isHidden = true
                segmentControl.isHidden = true
                sliderControl.isHidden = true
                stepperFunction.isHidden = true
                
                switchingControl.isOn = Bool(value!)!
                break
                
            case "textEditor":
                switchingControl.isHidden = true
                textEditor.isHidden = false
                segmentControl.isHidden = true
                sliderControl.isHidden = true
                stepperFunction.isHidden = true
                
                textEditor.text = value
                break
                
            case "segmentControl":
                switchingControl.isHidden = true
                textEditor.isHidden = true
                segmentControl.isHidden = false
                sliderControl.isHidden = true
                stepperFunction.isHidden = true
                
                segmentControl.selectedSegmentIndex = Int(value!)!
                break
                
            case "sliderControl":
                switchingControl.isHidden = true
                textEditor.isHidden = true
                segmentControl.isHidden = true
                sliderControl.isHidden = false
                stepperFunction.isHidden = true
                
                sliderControl.value = Float(value!)!
                break
                
            case "stepperFunction":
                switchingControl.isHidden = true
                textEditor.isHidden = true
                segmentControl.isHidden = true
                sliderControl.isHidden = true
                stepperFunction.isHidden = false
                
                stepperFunction.value = Double(value!)!
                break
                
            default:
                switchingControl.isHidden = true
                textEditor.isHidden = true
                segmentControl.isHidden = true
                sliderControl.isHidden = true
                stepperFunction.isHidden = true
            }
            
            
        }
        
    }
    
    @IBAction func submit(_ sender: Any) {
    switch controlLabel.text {
        case "switchingControl":
            let updateString = "switchingControl: \(`switchingControl`.isOn)"
            delegate?.update(to: updateString)
            
            navigationController?.popViewController(animated: true)
            break
            
        case "textEditor":
            let updateString = "textEditor: " + textEditor.text!
            delegate?.update(to: updateString)
            navigationController?.popViewController(animated: true)
            break
            
        case "segmentControl":
            let updateString = "segmentControl: \(segmentControl.selectedSegmentIndex)"
            delegate?.update(to: updateString)
            
            navigationController?.popViewController(animated: true)
            break
            
        case "sliderControl":
            let updateString = "sliderControl: \(sliderControl.value)"
            delegate?.update(to: updateString)
            
            navigationController?.popViewController(animated: true)
            break
            
        case "stepperFunction":
            let updateString = "stepperFunction: \(stepperFunction.value)"
            delegate?.update(to: updateString)
            
            navigationController?.popViewController(animated: true)
            break
            
        default:
            switchingControl.isHidden = true
            textEditor.isHidden = true
            segmentControl.isHidden = true
            sliderControl.isHidden = true
            stepperFunction.isHidden = true
        }
    }
    
    @IBAction func textChanged(_ sender: Any) {
    value = textEditor.text
        currentValue.text = "Current Value: \(value!)"
    }
    
    
    @IBAction func valueChanged(_ sender: AnyObject) {
    switch sender.tag {
        case 1:
            value = "\(switchingControl.isOn)"
        case 3:
            value = "\(segmentControl.selectedSegmentIndex)"
        case 4:
            value = "\(sliderControl.value)"
        case 5:
            value = "\(stepperFunction.value)"
        default:
            break
        }
        
        currentValue.text = "Current Value: \(value!)"
        
    }
}
