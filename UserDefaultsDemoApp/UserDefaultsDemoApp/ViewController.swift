//
//  ViewController.swift
//  UserDefaultsDemoApp
//
//  Created by Sam WU on 2021-07-14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    
    @IBOutlet weak var rememberMeLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @objc func applicationWillEnterForeground(notificaton: NSNotification) {
        let defaults = UserDefaults.standard
        defaults.synchronize()
        
        let fontsize = defaults.float(forKey: "fontsize_preference")
        let fontfamily = defaults.string(forKey: "fontfamily_preference")
        let customFont = UIFont(name: fontfamily!, size: CGFloat(fontsize))
        rememberMeLabel.font = customFont
        loginButton.titleLabel?.font = customFont
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillEnterForeground(notificaton:)), name: UIApplication.willEnterForegroundNotification, object: app)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        usernameTextField.text = defaults.string(forKey: "username_preference")
        passwordTextField.text = defaults.string(forKey: "password_preference")
        rememberMeSwitch.isOn = defaults.bool(forKey: "rememberme_preference")
        
//        let fontsize = defaults.float(forKey: "fontsize_preference")
//        let fontfamily = defaults.string(forKey: "fontfamily_preference")
//        let customFont = UIFont(name: fontfamily!, size: CGFloat(fontsize))
//        rememberMeLabel.font = customFont
//        loginButton.titleLabel?.font = customFont
        
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: UIButton) {
        if rememberMeSwitch.isOn {
            let defaults = UserDefaults.standard
            defaults.set(usernameTextField.text, forKey: "username_preference")
            defaults.set(passwordTextField.text, forKey: "password_preference")
            defaults.set(rememberMeSwitch.isOn, forKey: "rememberme_preference")
            print("login settings saved")
        } else {
            let defaults = UserDefaults.standard
            defaults.set("", forKey: "username_preference")
            defaults.set("", forKey: "password_preference")
            defaults.set(false, forKey: "rememberme_preference")
            print("login settings cleared")
        }
    }
    
    @IBAction func changeFont(_ sender: UIButton) {
    }
    
}

