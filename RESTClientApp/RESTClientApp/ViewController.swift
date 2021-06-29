//
//  ViewController.swift
//  RESTClientApp
//
//  Created by Sam WU on 2021-06-11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countryPickerView: UIPickerView!
    
    @IBOutlet weak var networkRequestIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkRequestIndicator.startAnimating()
        
    }


}

