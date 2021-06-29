//
//  CountryTableViewController.swift
//  WorldDatabaseApp
//
//  Created by Sam WU on 2021-06-21.
//

import UIKit

class CountryTableViewController: UITableViewController {
    
    let dataManager = CountryDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 600
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
        return dataManager.continents.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataManager.numberOfCountries()
        let currentContinent = dataManager.continents[section]
        return dataManager.numberOfCountries(for: currentContinent)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        // Configure the cell...
//        let currentCountry = dataManager.country(at: indexPath)
        let currentContinent = dataManager.continents[indexPath.section]
        let currentCountry = dataManager.countries(for: currentContinent)[indexPath.row]
    
        cell.textLabel?.text = currentCountry.name
        cell.detailTextLabel?.text = currentCountry.code
        let imageFileName = "\(currentCountry.name)-flag"
        cell.imageView?.image = UIImage(named: imageFileName)

        return cell
    }
  
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataManager.continents[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataManager.continents
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showCities" {
            if let cityVC = segue.destination as? CityViewController,
               let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                let currentCountry = dataManager.country(at: selectedIndexPath)
                cityVC.selectedCountryCode = currentCountry.code
                cityVC.selectedCountryName = currentCountry.name
            }
        }
    }
    

}
