//
//  ViewController.swift
//  HelloWorld
//
//  Created by Sam WU on 2021-05-05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBOutlet weak var greetingTextField: UITextField!
    
    var userName: String!
    
    @IBAction func changeGreeting(_ sender: UIButton) {
        // Copy the text from the TextField to the userName variable
        userName = greetingTextField.text
        
        var nameString = userName
        
        // Check if the userName value is empty
        if userName.isEmpty {
            nameString = "World 🤡"
        }
    

        let greetingMessage = "Hello, \(nameString ?? "ios")"
        greetingLabel.text = greetingMessage
        greetingTextField.text = ""
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

