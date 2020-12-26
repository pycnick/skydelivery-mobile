//
//  error.swift
//  skydelivery-mobile
//
//  Created by pycnick on 24.12.2020.
//

import ObjectMapper

class Error: Mappable {
    required init(map: Map) {
    }
    
    var Error: String?
    
    func mapping(map: Map) {
        Error <- map["error"]
    }
}
