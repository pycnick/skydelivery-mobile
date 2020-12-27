//
//  Orders.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import ObjectMapper

class Orders: Mappable {
    required init?(map: Map) {
    }
    
    var List: [Order]?
    
    func mapping(map: Map) {
        List <- map["orders"]
    }
}

class Order: Mappable {
    required init?(map: Map) {
    }
    
    var ID: Int?
    var RestID: Int?
    var Address: String?
    var Products: [Product]?
    var Price: Float?
    var Created: String?
    var Status: String?
    
    func mapping(map: Map) {
        ID <- map["id"]
        RestID <- map["restId"]
        Address <- map["address"]
        Products <- map["products"]
        Price <- map["price"]
        Created <- map["created_at"]
        Status <- map["status"]
    }
}
