//
//  ViewController.swift
//  NetworkRequestDemo
//
//  Created by Sam WU on 2021-06-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    let jitterApiManager = JitterApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func postJsonData(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let message = messageTextField.text else {
            return
        }
        jitterApiManager.postJsonData(forMessage: message, forUsername: username)
        usernameTextField.text = ""
        messageTextField.text = ""
        
    }
    
    @IBAction func postFormData(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let message = messageTextField.text else {
            return
        }
        jitterApiManager.postFormData(forMessage: message, forUsername: username)
        usernameTextField.text = ""
        messageTextField.text = ""
    }
    
}

