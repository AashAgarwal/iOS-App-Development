//
//  ViewController.swift
//  FaceIDProject
//
//  Created by Aashwatth Agarwal on 7/30/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        doFaceIDStuff()
    }

    func doFaceIDStuff(){
        let context = LAContext()
        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            print(error ?? "no error, somehow")
            return
        }
       
        switch context.biometryType {
        case .faceID:
            break
        case .touchID:
            break
        case .none:
            <#code#>
        @unknown default:
            <#code#>
        }
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "cuz i want to. You're a snitch?") { (authorized,  error) in
            print("Authorized? \(authorized)")
            print(error?.localizedDescription ?? "No error")
        }
    }
}

