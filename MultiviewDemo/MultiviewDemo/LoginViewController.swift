//
//  LoginViewController.swift
//  MultiviewDemo
//
//  Created by Sam WU on 2021-05-26.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func login(_ sender: UIButton) {
        // If the password is CPSC1519 then present the HomeViewController
        // otherwise use an Alert to indicate an incorrect password
        
        if let homeVC = storyboard?.instantiateViewController(identifier: "homeVC") {
            self.present(homeVC, animated: true, completion: nil)
        }
    
        
    }
    
    //    func addNum(num1: Int, num2: Int) -> Int {
//        return num1 + num2
//    }
//
//    func subNum(_ num1: Int, _ num2: Int) -> Int {
//        return num1 - num2
//    }
    
    @IBAction func closeHelpViewController(segue: UIStoryboardSegue) {
//        let sum = addNum(num1: 10, num2: 20)
//        let diff = subNum(10, 20)
    }

    @IBAction func closeHomeViewController(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
