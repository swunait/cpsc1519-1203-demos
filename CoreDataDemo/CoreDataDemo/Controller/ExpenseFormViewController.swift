//
//  ExpenseFormViewController.swift
//  CoreDataDemo
//
//  Created by Sam WU on 2021-08-04.
//

import UIKit

class ExpenseFormViewController: UIViewController {
    
    var editIndex: Int? = nil
    var editExpense: Expense? = nil

    @IBOutlet weak var expenseIdLabel: UILabel!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if editIndex != nil {
            if let editExpense = editExpense {
                expenseIdLabel.text = editExpense.expenseId
                descriptionTextField.text = editExpense.expenseDescription
                amountTextField.text = "\(editExpense.amount)"
                datePicker.date = editExpense.date!
            }
           
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if editExpense != nil {
            editExpense?.expenseDescription = descriptionTextField.text
            editExpense?.amount = Double(amountTextField.text!)!
            editExpense?.date = datePicker.date
        }
    }
    

}
