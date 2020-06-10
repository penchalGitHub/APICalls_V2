//
//  NewUser.swift
//  APICalls
//
//  Created by VijayNew on 09/06/20.
//  Copyright © 2020 VijayNew. All rights reserved.
//

import Foundation


class UserDetails:Codable{
    var data:NewUser?
}

class NewUser:Codable{
    var avatar:String?
    var first_name:String?
    var last_name:String?
    var id:Int? = 0
    var email:String?
}

class UserInfo:Codable{
    var page:Int?
    var per_page:Int?
    var total:Int?
    var total_pages:Int?
    var data:[NewUser]?
}

