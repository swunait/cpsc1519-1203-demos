//
//  CountryDataManager.swift
//  WorldDatabaseApp
//
//  Created by Sam WU on 2021-06-21.
//

import Foundation

class CountryDataManager {
    
//    var countryNames:[String] = [String]()
    private var countries: [Country] = []
    
    init() {
//        guard let plistUrl = Bundle.main.url(forResource: "CountryArrayString", withExtension: "plist"),
//              let items = NSArray(contentsOf: plistUrl) else {
//            return
//        }
//        countryNames = items as! [String]
        
        guard let plistUrl = Bundle.main.url(forResource: "country", withExtension: "plist"),
              let items = NSArray(contentsOf: plistUrl),
              let arrayOfDict = items as? [[String:AnyObject]]
              else {
            return
        }
        
        for currentDictionary in arrayOfDict {
            countries.append(Country(dict: currentDictionary))
        }
        
    }
    
    func country(at index: IndexPath) -> Country {
        return countries[index.item]
    }
    
    func numberOfCountries() -> Int {
        return countries.count
    }
    
}
