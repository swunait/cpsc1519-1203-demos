//
//  ViewController.swift
//  ButtonFun02
//
//  Created by Sam WU on 2021-05-17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        //let title = sender.title(for: .normal)!
        
        //let title = sender.title(for: UIControl.State.normal)!
//        let text = "\(title) button pressed"
//        titleLabel.text = text
        
        if let title = sender.title(for: .normal) {
            let text = "\(title) button pressed"
            titleLabel.text = text
        }
        
    }
}

