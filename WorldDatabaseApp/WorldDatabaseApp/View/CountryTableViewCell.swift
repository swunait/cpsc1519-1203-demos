//
//  CountryTableViewCell.swift
//  WorldDatabaseApp
//
//  Created by Sam WU on 2021-06-23.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryCodeLabel: UILabel!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var continentLabel: UILabel!
    
    @IBOutlet weak var surfaceAreaLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
