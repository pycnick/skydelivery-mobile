//
//  OrderData.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import Foundation

let storageName = "CartStorage"
let storageRestID = "CartStorageRestID"

class OrderStorage {    
    static var shared: OrderStorage = {
        let instance = OrderStorage()
        
        return instance
    }()
    
    var storage = UserDefaults.standard
    
    func getRestaurantID() -> Int {
        return storage.integer(forKey: storageRestID)
    }
    
    func setRestaurantID(RestID: Int) {
        return storage.set(RestID, forKey: storageRestID)
    }
    
    func isEmptyCart() -> Bool {
        if let obj = storage.object(forKey: storageName) {
            let dict = obj as! Dictionary<String, Int>
            
            return dict.isEmpty
        }
        
        return true
    }
    
    func addProduct(productID: String) -> Int {
        if let obj = storage.object(forKey: storageName) {
            var dict = obj as! Dictionary<String, Int>
            if dict[productID] == nil {
                dict[productID] = 1
            } else {
                dict[productID]! += 1
            }
            
            storage.setValue(dict, forKey: storageName)
            return dict[productID]!
        }
        
        let newDict: [String:Int] = [productID: 1]
        storage.set(newDict, forKey: storageName)
        
        return 1
    }
    
    func addExistProduct(productID: String) -> Int {
        if let obj = storage.object(forKey: storageName) {
            var dict = obj as! Dictionary<String, Int>
            if dict[productID] == nil {
                return 0
            } else {
                dict[productID]! += 1
            }
            
            storage.setValue(dict, forKey: storageName)
            return dict[productID]!
        }
        
        return 0
    }
    
    func getProductCount(productID: String) -> Int {
        if let obj = storage.object(forKey: storageName) {
            var dict = obj as! Dictionary<String, Int>
            if dict[productID] == nil {
                return 0
            } else {
                return dict[productID]!
            }
        }
        
        return 0
    }
    
    func deleteProduct(productID: String) -> Int {
        if let obj = storage.object(forKey: storageName) {
            var dict = obj as! Dictionary<String, Int>
            dict[productID]! -= 1
            if dict[productID]! <= 0 {
                dict.removeValue(forKey: productID)
                storage.setValue(dict, forKey: storageName)
                
                return 0
            }
            
            storage.setValue(dict, forKey: storageName)
            return dict[productID]!
        }

        let newDict = [productID: 1]
        storage.setValue(newDict, forKey: storageName)
        
        return 0
    }
    
    func cleanCart() {
        storage.setValue([:], forKey: storageName)
    }
    
    func getOrder() -> Dictionary<String, Int> {
        if let obj = storage.object(forKey: storageName) {
            return obj as! Dictionary<String, Int>
        }
        
        return [:]
    }
}
