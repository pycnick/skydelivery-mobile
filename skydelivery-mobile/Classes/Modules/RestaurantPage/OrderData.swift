//
//  OrderData.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import Foundation

class OrderStorage {
    
    static var shared: OrderStorage = {
        let instance = OrderStorage()
        return instance
    }()
    
    var storage = UserDefaults.standard
    
    func getRestaurantID() -> Int {
            return 0
    }
    
    func addProduct(productID: Int) -> Int {
        return 0
    }
    
    func deleteProduct(product: Int) -> Int {
        return 0
    }
    
    func getOrder() {
        
    }
}
