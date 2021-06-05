//
//  LoginViewController.swift
//  MultiViewAppDemo
//
//  Created by Sam WU on 2021-05-31.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func unwindFromHomeVC(segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
        usernameTextField.becomeFirstResponder()
        
        let homeVC : HomeViewController = segue.source as! HomeViewController
        titleLabel.text = "Lucky \(homeVC.randomInt) "
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        if let username = usernameTextField.text,
           let password = passwordTextField.text {
            
            // Create a new dictionary of username/password
            if let path = Bundle.main.path(forResource: "UserAccounts", ofType: "plist"),
               let dict = NSDictionary(contentsOfFile: path) as? [String: String] {
                if dict[username] == password {
                    
                    self.performSegue(withIdentifier: "toHomeVCSegue", sender: self)
                    
//                    if let homeVC : HomeViewController = self.storyboard?.instantiateViewController(identifier: "homeVC") {
//                        self.present(homeVC, animated: true, completion: nil)
//                    }
                    
                    
                } else if dict[username] == nil {
                    print("Invalid username")
                    let alert = UIAlertController(title: "Login Failure", message: "Incorrect username", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                        action -> Void in
                        // Just dismiss the action sheet
                    })
                    
                    alert.addAction(okAction)
                    
                    self.present(alert, animated: true, completion: nil)
                } else {
                    print("Incorrect password")
                    let alert = UIAlertController(title: "Login Failure", message: "Incorrect password!", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                        action -> Void in
                        // Just dismiss the action sheet
                    })
                    
                    alert.addAction(okAction)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
            } else {
                print("Error reading from property list file")
            }
            
        }
        
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
//        view.endEditing(true)
        
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let homeVC : HomeViewController = segue.destination as? HomeViewController else {
            return
        }
        
        // Pass the selected object to the new view controller.
        homeVC.loggedInUsername = usernameTextField.text
    }
    

}
