//
//  TheMealDbApi.swift
//  RESTClientApp
//
//  Created by Sam WU on 2021-08-06.
//

import Foundation

struct TheMealDbApi {
    
    static let baseUrlString = "https://www.themealdb.com/api/json/v1/1/"
    
    static func listAllMealCategories(forCompletionHandler completionHandler: @escaping (MealCategoryResponse) -> Void) {
        
        let allMealCategoriesString = baseUrlString + "categories.php"
        guard let allMealCategoriesURL = URL(string: allMealCategoriesString) else {
            return
        }
        var allMealCategoriesGetRequest = URLRequest(url: allMealCategoriesURL)
        allMealCategoriesGetRequest.httpMethod = "GET"
//        allMealCategoriesGetRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let allMealCategoriesTask = URLSession.shared.dataTask(with: allMealCategoriesGetRequest) {
            data, response, error in
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200, let data = data {
                    if let responseJson = try? JSONDecoder().decode(MealCategoryResponse.self, from: data) {
                        OperationQueue.main.addOperation {
                            completionHandler(responseJson)
                        }
                    }
                }
            }
            
        }
        
        allMealCategoriesTask.resume()
        
    }
    
}
