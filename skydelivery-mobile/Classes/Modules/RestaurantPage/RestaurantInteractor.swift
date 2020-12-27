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
            if let list = products?.List {
                for product in list {
//                    let orderedCount
                    var data = ProductData(restid: product.RestID!, name: product.Name!, id: product.ID!, countAdded: 0, backgroundImage: UIImage())
                    
                    
                    
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
                
            }
        }
    }
}
