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

struct GetProductsRequest {
    init(restaurant: Int, page: Int, count: Int) {
        ID = restaurant
        Page = page
        Count = count
    }
    
    var ID: Int
    var Page: Int
    var Count: Int
}
