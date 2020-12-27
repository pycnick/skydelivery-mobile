//
//  CartInteractor.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 27.12.2020.
//

import UIKit

class CartInteractor {
    var presenter: InteractorToPresenterCartProtocol?
    var storage = OrderStorage.shared
    
    var api = ApiManager.shared
}

extension CartInteractor: PresenterToInteractorCartProtocol {
    func LoadCartProducts() {
        let dict = storage.getOrder()
        var data: [CartProductData] = []
        
        for x in dict {
            self.api.GetProduct(prodID: Int(x.key)!) { (product) in
                data.append(CartProductData(product: product!, count: x.value))
                
                self.presenter?.UpdateCartProducts(data: data)
            }
            
        }
        
    }
    
    func AddCartProduct(ID: Int) {
        
    }
    
    func RemoveCartProduct(ID: Int) {
        
    }
}
