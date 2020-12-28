//
//  RestaurantInteractor.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import UIKit

class RestaurantsInteractor {
    var presenter: InteractorToPresenterRestaurantProtocol?
    var api = ApiManager.shared
    var storage = OrderStorage.shared
}

extension RestaurantsInteractor: PresenterToInteractorRestaurantProtocol {
    func LoadProducts(req: GetProductsRequest) {
        var newData = [ProductData]()
        api.GetRestaurantProducts(req: req) { (products) in
            let orderedMap = self.storage.getOrder()
            
            if let list = products?.List {
                if list.isEmpty {
                    self.presenter?.UpdateProducts(data: newData)
                    
                    return
                }
                
                for product in list {
                    var orderedCount = 0
                    if let count = orderedMap[String(product.ID!)] {
                        orderedCount = count
                    }
                    
                    var data = ProductData(restid: req.ID, name: product.Name!, id: product.ID!, countAdded: orderedCount, price: product.Price!,  backgroundImage: UIImage())
                    
                    self.api.GetImage(url: product.Image!) { (image) in
                        if image != nil {
                            data.backgroundImage = image!
                        } else {
                            print("error image nil")
                        }
                        
                        newData.append(data)
                        self.presenter?.UpdateProducts(data: newData)
                    }
                }
                
            } else {
                self.presenter?.UpdateProducts(data: newData)
            }
        }
    }
}
