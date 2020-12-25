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
