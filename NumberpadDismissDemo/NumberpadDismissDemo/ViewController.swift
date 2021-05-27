//
//  ViewController.swift
//  NumberpadDismissDemo
//
//  Created by Sam WU on 2021-05-17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberpadTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let stringValue = "100"
//        let intValue = Int(stringValue)
//        let doubleValue = Double("99.99")
        
        // Do any additional setup after loading the view.
    }

    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        //numberpadTextField.resignFirstResponder()
        view.endEditing(true)
    }
    
}

