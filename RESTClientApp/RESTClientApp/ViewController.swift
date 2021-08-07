//
//  ViewController.swift
//  RESTClientApp
//
//  Created by Sam WU on 2021-06-11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countryPickerView: UIPickerView!
    
    @IBOutlet weak var networkRequestIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkRequestIndicator.startAnimating()
        
        TheMealDbApi.listAllMealCategories { currentMealCategoryResponse in
            self.networkRequestIndicator.stopAnimating()
            
            print("The number of cateogries \(currentMealCategoryResponse.categories.count)")
            for currentMealCategory in currentMealCategoryResponse.categories {
                print("\(currentMealCategory.idCategory)")
                print("\(currentMealCategory.strCategory)")
                print("\(currentMealCategory.strCategoryThumb)")
                print("\(currentMealCategory.strCategoryDescription)")
                
            }
            
        }
        
    }


}

