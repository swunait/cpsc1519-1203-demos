//
//  CityDataManager.swift
//  WorldDatabaseApp
//
//  Created by Sam WU on 2021-06-30.
//

import Foundation

class CityDataManager {
    
    private var cities: [City] = []
    
    init() {
        guard let jsonUrl = Bundle.main.url(forResource: "city", withExtension: "json") else {
            return
        }
        do {
            let jsonData = try Data(contentsOf: jsonUrl)
            let items = try JSONDecoder().decode([City].self, from: jsonData)
            cities = items
        } catch {
            print("There was an error reading city.json \(error)")
        }
    }
    
    func distinctDistricts(for countryCode: String) -> [String] {
        return Array(
                Set(cities
            .filter { $0.countryCode == countryCode }
            .map { $0.district })
               )
            .sorted()
    }
    
    func cities(forCountry countryCode: String, forDistrict district: String) -> [City] {
        return cities
            .filter { $0.countryCode == countryCode }
            .filter { $0.district == district }
            
    }
}
