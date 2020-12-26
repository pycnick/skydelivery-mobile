//
//  Product.swift
//  skydelivery-mobile
//
//  Created by pycnick on 25.12.2020.
//

import ObjectMapper

class Products: Mappable {
    required init?(map: Map) {
    }
    
    var List: [Product]?
    
    func mapping(map: Map) {
        List <- map["products"]
    }
}

class Product: Mappable {
    required init(map: Map) {
    }
    
    var ID: Int?
    var Name: String?
    var Price: Float?
    var Image: String?
    var RestID: Int?
    var Count: Int?
    var Tag: Int?
    
    func mapping(map: Map) {
        ID <- map["id"]
        Name <- map["name"]
        Price <- map["price"]
        Image <- map["image"]
        RestID <- map["rest_id"]
        Count <- map["count"]
        Tag <- map["tag"]
    }
}
