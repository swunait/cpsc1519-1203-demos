//
//  SingleComponentPickerViewController.swift
//  TabBarControllerAndPickerViewDemo
//
//  Created by Sam WU on 2021-06-02.
//

import UIKit

class SingleComponentPickerViewController:
    UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row]
    }
    
    private let characterNames = ["Luke","Leia","Han"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        pickerView.delegate = self
//        pickerView.dataSource = self
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        print("Selected \(characterNames[selectedRow])")
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
