//
//  Tags.swift
//  skydelivery-mobile
//
//  Created by pycnick on 26.12.2020.
//

import ObjectMapper

class Tags: Mappable {
    required init?(map: Map) {
    }
    
    var List: [Tag]?
    
    func mapping(map: Map) {
        List <- map["rest_tags"]
    }
    
}

class Tag: Mappable {
    required init?(map: Map) {
    }
    
    var ID: Int?
    var Name: String?
    
    func mapping(map: Map) {
        ID <- map["id"]
        Name <- map["name"]
    }
}
