//
//  ExpenseCoreDataManager.swift
//  CoreDataDemo
//
//  Created by Sam WU on 2021-08-04.
//

import Foundation
import CoreData

class ExpenseCoreDataManager {
    
    var expenses:[Expense] = []
    
    func fetchAllExpense() -> [Expense] {
        let request: NSFetchRequest<Expense> = Expense.fetchRequest()
        guard let results = try? persistentContainer.viewContext.fetch(request) else {
            return []
        }
        return results
    }
    
    init() {
        expenses = fetchAllExpense()
    }
    
    func addExpense(
        withDescription description: String,
        withAmount amount: Double,
        withDate date: Date) {
        
        let newExpense = Expense(context: persistentContainer.viewContext)
        newExpense.expenseId = UUID().uuidString
        newExpense.expenseDescription = description
        newExpense.amount = amount
        newExpense.date = date
        saveContext()
        expenses = fetchAllExpense()
    }
    
    func deleteExpnse(at index: Int) {
        let currentExpense = expenses[index]
        persistentContainer.viewContext.delete(currentExpense)
        saveContext()
        expenses = fetchAllExpense()
    }
    
    func update(_ currentExpense: Expense) {
        saveContext()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ExpenseModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
