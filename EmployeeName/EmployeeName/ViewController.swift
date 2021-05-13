//
//  ViewController.swift
//  EmployeeName
//
//  Created by Sam WU on 2021-05-07.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var employeeNameTextField: UITextField!
    
    @IBOutlet weak var employeeSalaryTextField: UITextField!
    
    @IBOutlet weak var employeeAgeTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onSubmitTapped(_ sender: UIButton) {
        // Retrieve the employee name value from the TextField
        let employeeName = employeeNameTextField.text
        let employeeSalary: Double = Double(employeeSalaryTextField.text!)!
        let employeeAge: Int = Int(employeeAgeTextField.text!)!
        
        // Define a message with the employeeName, employeeSalary, and employeeAge
        let message = "Added the employee: \(employeeName!) , \(employeeSalary) , \(employeeAge)"
        // Change the text of the message Label
        messageLabel.text = message
        print(message)
        
        // Clear the text in each TextField
        employeeNameTextField.text = ""
        employeeSalaryTextField.text = ""
        employeeAgeTextField.text = ""
        
        
    }
    
    
    @IBAction func dismissKeyboard(_ sender: UITextField) {
        sender.resignFirstResponder()
        
        employeeSalaryTextField.becomeFirstResponder()
    }
    
    @IBAction func dismissNumberPad(_ sender: Any) {
        print("dismiss NumberPad")
        employeeSalaryTextField.resignFirstResponder()
        employeeAgeTextField.resignFirstResponder()
    }
    
    

}

