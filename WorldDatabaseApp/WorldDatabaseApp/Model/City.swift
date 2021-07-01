//
//  City.swift
//  WorldDatabaseApp
//
//  Created by Sam WU on 2021-06-30.
//

import Foundation

struct City : Decodable {
    
    var name: String
    var district: String
    var population: Int
    var countryCode: String
    var cityId: Int
    
    enum CodingKeys: String, CodingKey {
        case cityId = "id"
        case countryCode
        case district
        case name
        case population
    }
    
}
