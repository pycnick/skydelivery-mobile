//
//  OrderInteractor.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 28.12.2020.
//

import Foundation

class OrderInteractor {
    var presenter: InteractorToPresenterOrderProtocol?
    
    var api = ApiManager.shared
    var storage = OrderStorage.shared
}

extension OrderInteractor : PresenterToInteractorOrderProtocol {
    func checkoutOrder(order: OrderRequest) {
        var req = order
        var products: [ProductReq] = []
        
        api.GetProfile { (Profile) in
            if let userID = Profile?.User?.ID {
                req.UserID = userID
            } else {
                return
            }
            
            let restID = self.storage.getRestaurantID()
            req.RestID = restID
            
            let productIDs = self.storage.getOrder()
            for p in productIDs {
                products.append(ProductReq(prodID: Int(p.key)!, count: p.value))
            }
            
            req.Products = products
            
            print(req)
        }
    }
}
