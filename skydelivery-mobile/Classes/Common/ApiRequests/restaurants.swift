//
//  restaurants.swift
//  skydelivery-mobile
//
//  Created by pycnick on 25.12.2020.
//

struct GetRestaurantsRequest {
    init(page: Int, count: Int) {
        Page = page
        Count = count
    }
    
    var Page: Int
    var Count: Int
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
