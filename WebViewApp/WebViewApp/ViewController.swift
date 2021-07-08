//
//  ViewController.swift
//  WebViewApp
//
//  Created by Sam WU on 2021-06-11.
//

import UIKit

import WebKit   // for WKWebView class

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var webSiteLocationTextField: UITextField!
    
    @IBOutlet weak var webSiteWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        webSiteLocationTextField.delegate = self
        
        loadWebPage(webSiteAddress: "https://www.nait.ca")
    }

    func loadWebPage(webSiteAddress: String) {
        guard let webSiteUrl = URL(string: webSiteAddress) else {
            return
        }
        let webSiteRequest = URLRequest(url: webSiteUrl)
        webSiteWebView.load(webSiteRequest)
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        loadWebPage(webSiteAddress: textField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

