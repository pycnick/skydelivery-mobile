//
//  Profile.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 26.12.2020.
//

import ObjectMapper

class ProfileEl: Mappable {
    required init?(map: Map) {
    }
    
    var ID: Int?
    var Email: String?
    var FirstName: String?
    var LastName: String?
    var Phone: String?
    
    func mapping(map: Map) {
        ID <- map["id"]
        Email <- map["email"]
        FirstName <- map["firstName"]
        LastName <- map["lastName"]
        Phone <- map["phone"]
    }
}

class Profile: Mappable {
    required init?(map: Map) {
    }
    
    var User: ProfileEl?
    
    func mapping(map: Map) {
        User <- map["User"]
    }
    
}

