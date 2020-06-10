//
//  ViewModel.swift
//  APICalls
//
//  Created by VijayNew on 09/06/20.
//  Copyright © 2020 VijayNew. All rights reserved.
//

import UIKit

class ViewModel {
    
    
    let baseURL = "https://reqres.in/api/users/"
    
    func getUserDetails(userID:Int, completionHandler: @escaping (UserDetails) -> Void ){
        
        let urlString = baseURL + "\(userID)"
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil{
                print("Got error for API Call \(String(describing: error))")
            }
            
            guard let data = data else {return}
            
            do {
                let userInformation = try JSONDecoder().decode(UserDetails.self, from: Data(data))
                print(userInformation.data?.first_name ?? "")
                print(userInformation.data?.avatar ?? "")
                completionHandler(userInformation)
                
            }catch{
                print("Error occured while parsing the data\(error)")
            }
        }
        task.resume()
    }
    
    
    
//Multiple Users per page
    
    let pageBaseURL = "https://reqres.in/api/users?"
    func getUsersDetails(pageID:Int, completionHandler: @escaping ([NewUser]) -> Void ){
        
        let urlString = pageBaseURL + "page\(pageID)"
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil{
                print("Got error for API Call \(String(describing: error))")
            }
            
            guard let data = data else {return}
            
            do {
                let userInformation = try JSONDecoder().decode(UserInfo.self, from: Data(data))
//                print(userInformation.data?[0].first_name ?? "")
//                print(userInformation.data?[0].last_name ?? "")
//                print(userInformation.data?[0].email ?? "")
                completionHandler(userInformation.data ?? [])
            }catch{
                print("Error occured while parsing the data\(error)")
            }
        }
        task.resume()
    }

}










