//
//  HomeViewController.swift
//  MultiviewDemo
//
//  Created by Sam WU on 2021-05-26.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var randomNumberLabel: UILabel!
    
    var randomInt : Int = 1
    
    var loggedInUsername : String = "Unknown User"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameLabel.text = loggedInUsername
        randomInt = Int.random(in: 1...50)
        randomNumberLabel.text = "\(randomInt)"
    }
    
    @IBAction func generateTapped(_ sender: Any) {
        randomInt = Int.random(in: 1...50)
        randomNumberLabel.text = "\(randomInt)"
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let loginVC = segue.destination as? LoginViewController else {
            return
        }
        // Pass the selected object to the new view controller.
        loginVC.usernameTextField.text = "user\(randomInt)"
        
    }
    

}
