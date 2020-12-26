//
//  Restaurant.swift
//  skydelivery-mobile
//
//  Created by pycnick on 22.11.2020.
//

import ObjectMapper

class Restaurants: Mappable {
    required init(map: Map) {
    }
    
    var List: [Restaurant]?
    
    func mapping(map: Map) {
        List <- map["restaurants"]
    }
}

class Restaurant: Mappable {
    required init(map: Map) {
    }
    
    init(name: String) {
        Name = name
    }
    
    var ID: Int?
    var ManagerID: Int?
    var Name: String?
    var Description: String?
    var Rating: Float?
    var Image: String?
    
    func mapping(map: Map) {
        ID <- map["id"]
        ManagerID <- map["managerId"]
        Name <- map["name"]
        Description <- map["description"]
        Rating <- map["rating"]
        Image <- map["image"]
    }
}
