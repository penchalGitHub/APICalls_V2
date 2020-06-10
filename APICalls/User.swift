//
//  User.swift
//  APICalls
//
//  Created by VijayNew on 09/06/20.
//  Copyright © 2020 VijayNew. All rights reserved.
//

import Foundation

class User{
    var avatar:String?
    var first_name:String?
    var last_name:String?
    var id:Int? = 0
    var email:String?
    

    init(userDetails:[String:Any]){
        avatar = userDetails["avatar"] as? String
        first_name = userDetails["first_name"] as? String
        last_name = userDetails["last_name"] as? String
        id = userDetails["id"] as? Int
        email = userDetails["email"] as? String
    }
    

}
