//
//  MealCategoryResponse.swift
//  RESTClientApp
//
//  Created by Sam WU on 2021-08-06.
//

import Foundation

struct MealCategoryResponse : Codable {
    var categories: [MealCategory]
    
}

struct MealCategory : Codable {
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
}




