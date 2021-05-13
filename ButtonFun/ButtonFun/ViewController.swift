//
//  ViewController.swift
//  ButtonFun
//
//  Created by Sam WU on 2021-05-10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let title = sender.title(for: .selected)!
        let text = "\(title) button pressed"
        statusLabel.text = text
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let leftSideButton = leftButton // leftSideButton is implicity unwrapped
//        let rightSideButton = rightButton!  // Optional needs to be unwrapped
    }

    

}

