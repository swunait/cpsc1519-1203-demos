//
//  HomeViewController.swift
//  MultiViewAppDemo
//
//  Created by Sam WU on 2021-05-31.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var randomNumberLabel: UILabel!
    
    var randomInt: Int = 1

    
    var loggedInUsername: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.topItem?.title = loggedInUsername
        print("Title: \(String(describing: self.navigationItem.title))")
        
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
        guard let loginVC : LoginViewController = segue.destination as? LoginViewController else {
            return
        }
        // Pass the selected object to the new view controller.
        print("existing HomeViewController")
        loginVC.titleLabel.text = "Lucky number \(randomInt)"
    }
    

}
