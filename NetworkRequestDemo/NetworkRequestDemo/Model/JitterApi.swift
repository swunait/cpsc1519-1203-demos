//
//  JitterApi.swift
//  NetworkRequestDemo
//
//  Created by Sam WU on 2021-06-09.
//

import Foundation

class JitterApi {
    
    func postFormData(forMessage message: String, forUsername username: String) {
        let urlString = "https://capstone1.app.dmitcapstone.ca/api/jitters/JitterServlet"
        let jittersURL = URL(string: urlString)!
        var postRequest = URLRequest(url: jittersURL)
        postRequest.httpMethod = "POST"
        postRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let formData = "LOGIN_NAME=\(username)&DATA=\(message)"
        
        postRequest.httpBody = formData.data(using: String.Encoding.utf8)
        
        let postTask = URLSession.shared.dataTask(with: postRequest) {
            data, response, error in
            
            if let data = data {
                print(data)
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
                print("Headers: \(response.allHeaderFields)")
            }
            
            if let error = error {
                print(error)
            }
        }
        postTask.resume()
    
    }
    
    func postJsonData(forMessage message: String, forUsername username: String) {
        let urlString = "https://capstone1.app.dmitcapstone.ca/api/jitters"
        let jittersURL = URL(string: urlString)!
        var postRequest = URLRequest(url: jittersURL)
        postRequest.httpMethod = "POST"
        postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newJitter = Jitter(loginName: username, data: message)
        
        guard let requestJsonData = try? JSONEncoder().encode(newJitter) else {
            print("Error converting data to JSON format")
            return
        }
        postRequest.httpBody = requestJsonData
        
        let postTask = URLSession.shared.dataTask(with: postRequest) {
            data, response, error in
            
            if let data = data {
                print(data)
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
                print("Headers: \(response.allHeaderFields)")
            }
            
            if let error = error {
                print(error)
            }
        }
        postTask.resume()
    
    }
}
