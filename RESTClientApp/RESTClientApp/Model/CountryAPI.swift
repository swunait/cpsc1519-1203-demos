//
//  CountryAPI.swift
//  RESTClientApp
//
//  Created by Sam WU on 2021-06-11.
//

import Foundation

struct CountryAPI {
    
    static let baseUrlString = "https://capstone1.app.dmitscapstone.ca/api/"
    
    static func fetchCountries(forCompletionHanlder completionHandler: @escaping ([Country]) -> Void) {
        
        let countryUrlString = baseUrlString + "world/country"
        guard let countryURL = URL(string: countryUrlString) else {
            return
        }
        var fetchRequest = URLRequest(url: countryURL)
        fetchRequest.httpMethod = "GET"
        
        let fetchCountryTask = URLSession.shared.dataTask(with: fetchRequest) {
            data, response, error in
            
            if let data = data {
                if let responseBody = try? JSONDecoder().decode(Array<Country>.self, from: data) {
                    completionHandler(responseBody)
                }
            }
    
        }
        fetchCountryTask.resume()
        
    }
}
