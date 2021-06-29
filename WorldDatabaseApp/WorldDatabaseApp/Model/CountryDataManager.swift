//
//  CountryDataManager.swift
//  WorldDatabaseApp
//
//  Created by Sam WU on 2021-06-21.
//

import Foundation

class CountryDataManager {
    
    private var countries: [Country] = []
    let continents = ["Asia","Europe","North America","Africa","Ocenia","South America"].sorted()
    
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
            let currentCountry = Country(dict: currentDictionary)
            countries.append(currentCountry)
        }
        
    }
    
    func country(at index: IndexPath) -> Country {
        return countries[index.row]
    }
    
    func numberOfCountries() -> Int {
        return countries.count
    }
    
    func countries(for continent: String) -> [Country] {
        return countries.filter { $0.continent == continent }
    }
    
    func numberOfCountries(for continent: String) -> Int {
        return countries.filter { $0.continent == continent}.count
    }
    
    
    
}
