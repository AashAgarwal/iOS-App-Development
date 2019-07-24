//
//  EditViewController.swift
//  TableViewProject
//
//  Created by Aashwatth Agarwal on 7/24/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate {
    func update(to newValue: String)
}

class EditViewController: UIViewController {

    @IBOutlet weak var editTextField: UITextField!
    var stringToEdit: String?
    var delegate: EditViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTextField.text = stringToEdit
    }
    
    @IBAction func submit(_ sender: Any) {
        //    dismiss(animated: true, completion: nil)
        if let updateString = editTextField.text {
            delegate?.update(to: updateString)
        }
        navigationController?.popViewController(animated: true)
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
