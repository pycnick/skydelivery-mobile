//
//  OrderData.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import Foundation

class OrderStorage {
    let storageName = "CartStorage"
    
    static var shared: OrderStorage = {
        let instance = OrderStorage()
        return instance
    }()
    
    var storage = UserDefaults.standard
    
    func getRestaurantID() -> Int {
        return 0
    }
    
    func addProduct(productID: Int) -> Int {
        if let obj = storage.object(forKey: storageName) {
            var dict = obj as! Dictionary<Int, Int>
            if dict[productID] == nil {
                dict[productID] = 1
            } else {
                dict[productID]! += 1
            }
            
            storage.setValue(dict, forKey: storageName)
            return dict[productID]!
        }

        let newDict = [productID: 1]
        storage.setValue(newDict, forKey: storageName)
        
        return 1
    }
    
    func deleteProduct(productID: Int) -> Int {
        if let obj = storage.object(forKey: storageName) {
            var dict = obj as! Dictionary<Int, Int>
            dict[productID]! -= 1
            if dict[productID]! <= 0 {
                dict.removeValue(forKey: productID)
                return 0
            }
            
            storage.setValue(dict, forKey: storageName)
            return dict[productID]!
        }

        let newDict = [productID: 1]
        storage.setValue(newDict, forKey: storageName)
        
        return 0
    }
    
    func getOrder() {
        
    }
}
