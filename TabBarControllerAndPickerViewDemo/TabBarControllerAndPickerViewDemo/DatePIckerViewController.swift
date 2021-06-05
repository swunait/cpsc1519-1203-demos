//
//  DatePIckerViewController.swift
//  TabBarControllerAndPickerViewDemo
//
//  Created by Sam WU on 2021-06-02.
//

import UIKit

class DatePIckerViewController: UIViewController {

    @IBOutlet weak var datePIcker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
       
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let date = datePIcker.date
        let message = "The date you seleted is \(date)"
        let title = "Date Selected"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
