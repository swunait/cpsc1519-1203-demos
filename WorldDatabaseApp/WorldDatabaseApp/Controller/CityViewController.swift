//
//  CityViewController.swift
//  WorldDatabaseApp
//
//  Created by Sam WU on 2021-06-23.
//

import UIKit

class CityViewController: UIViewController {

    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var cityTableView: UITableView!
    
    var selectedCountryCode: String?
    var selectedCountryName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        countryNameLabel.text = selectedCountryName
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

extension CityViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        
        return cell
    }
    
    
}
