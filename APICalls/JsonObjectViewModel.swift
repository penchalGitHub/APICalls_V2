//
//  JsonObjectViewModel.swift
//  APICalls
//
//  Created by VijayNew on 10/06/20.
//  Copyright © 2020 VijayNew. All rights reserved.
//

import Foundation

import UIKit

class JsonObjectViewModel {
    
    
    let baseURL = "https://reqres.in/api/users/"
    let pageBaseURL = "https://reqres.in/api/users?page=2"
    var userInfo:[String:Any]?
    var userInfos:[User] = []
    
    func getUserDetails(userID:Int, completionHandler: @escaping ([User]) -> Void ){
        
        let urlString = pageBaseURL
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil{
                print("Got error for API Call \(String(describing: error))")
            }
            
            guard let data = data else {return}
            do {
                self.userInfos = try (JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [User])!
                completionHandler(self.userInfos)
            }catch{
                print("Error occured while parsing the data\(error)")
            }
        }
        task.resume()
    }
    
    
    
    func getUsersDetails(userID:Int, completionHandler: @escaping ([User]) -> Void ){
        
        let urlString = baseURL
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil{
                print("Got error for API Call \(String(describing: error))")
            }
            
            guard let data = data else {return}
            do {
                self.userInfo = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                completionHandler(self.userInfos)
            }catch{
                print("Error occured while parsing the data\(error)")
            }
        }
        task.resume()
    }
    
}
 
