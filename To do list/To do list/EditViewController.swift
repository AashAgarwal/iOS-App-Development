//
//  EditViewController.swift
//  To do list
//
//  Created by Aashwatth Agarwal on 7/15/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate {
    func update(to newValue: String)
    func delete()
}

class EditViewController: UIViewController {
    
    @IBOutlet weak var textEditor: UITextField!
    
    var stringToEdit : String?
    var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textEditor.text = stringToEdit
    }
    
    @IBAction func submit(_ sender: UIButton) {
    
        if sender.tag == 0 {
        if let updateString = textEditor.text {
            delegate?.update(to: updateString)
        }
        }
        else if sender.tag == 1 {
            delegate?.delete()
            }
        navigationController?.popViewController(animated: true)
        }
}
