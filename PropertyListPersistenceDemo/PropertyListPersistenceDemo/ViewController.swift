//
//  ViewController.swift
//  PropertyListPersistenceDemo
//
//  Created by Sam WU on 2021-07-16.
//

import UIKit

class ViewController: UIViewController {

    let dataManger = CustomFontDataManager()
    
    @IBOutlet weak var fontTablewView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fontTablewView.dataSource = self
        fontTablewView.delegate = self
    }


    @IBAction func selectFontTapped(_ sender: UIButton) {
        // Open a segue to a view controller for the user to pick a font from
        // a collection view
        
        // Create a sample font to add
        var sampleFont = CustomFont()
        sampleFont.fontName = "Helvetica"
        sampleFont.fontSize = 16
        dataManger.add(sampleFont)
        dataManger.writeToFile()
        fontTablewView.reloadData()
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManger.customFonts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        
        let currentFont = dataManger.customFonts[indexPath.row]
        cell.textLabel?.text = currentFont.fontName
        cell.textLabel?.font = UIFont(name: currentFont.fontName, size: CGFloat(currentFont.fontSize))
        cell.detailTextLabel?.text = "\(currentFont.fontSize)"
        
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataManger.delete(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}


