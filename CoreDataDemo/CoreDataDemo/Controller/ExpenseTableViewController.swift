//
//  ExpenseTableViewController.swift
//  CoreDataDemo
//
//  Created by Sam WU on 2021-08-04.
//

import UIKit

class ExpenseTableViewController: UIViewController {

    @IBOutlet weak var expenseTableView: UITableView!
    
    let dataManager = ExpenseCoreDataManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        expenseTableView.dataSource = self
        expenseTableView.delegate = self
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "editExpenseSegue" {
            guard let expenseFormVC = segue.destination as? ExpenseFormViewController,
                  let selectedCell = sender as? UITableViewCell,
                  let selectedIndexPath = expenseTableView.indexPath(for: selectedCell)
            else { return }
            
            let currentExpense = dataManager.expenses[selectedIndexPath.row]
            expenseFormVC.editIndex = selectedIndexPath.row
            expenseFormVC.editExpense = currentExpense
        }
    }

}

extension ExpenseTableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        
        let currentExpense = dataManager.expenses[indexPath.row]
        cell.textLabel?.text = currentExpense.expenseDescription
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        cell.detailTextLabel?.text = nf.string(from: NSNumber(value: currentExpense.amount))
        
        return cell
    }
}

extension ExpenseTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            dataManager.deleteExpnse(at: indexPath.row)
            tableView.reloadData()
        }
        
    }
}

extension ExpenseTableViewController {
    
    @IBAction func cancelExpenseForm(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func saveExpenseForm(segue: UIStoryboardSegue) {
        guard let expenseFormVC = segue.source as? ExpenseFormViewController
        else { return }
        
        if expenseFormVC.editExpense == nil {
            let description = expenseFormVC.descriptionTextField.text!
            let amount = Double(expenseFormVC.amountTextField.text!)!
            let date = expenseFormVC.datePicker.date
            dataManager.addExpense(withDescription: description, withAmount: amount, withDate: date)
        } else {
            dataManager.update(expenseFormVC.editExpense!)
        }
        expenseTableView.reloadData()
    }
}
