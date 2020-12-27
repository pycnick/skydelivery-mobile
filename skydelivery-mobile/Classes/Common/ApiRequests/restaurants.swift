//
//  restaurants.swift
//  skydelivery-mobile
//
//  Created by pycnick on 25.12.2020.
//

struct GetRestaurantsRequest {
    init(page: Int, count: Int, tag: Int) {
        Page = page
        Count = count
        Tag = tag
    }
    
    var Page: Int
    var Count: Int
    var Tag: Int
}
