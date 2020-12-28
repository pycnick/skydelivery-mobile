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
                var rest = (CartProductData(product: product!, image: UIImage(), count: x.value))
                
                self.api.GetImage(url: product!.Image!) { (image) in
                    if image != nil {
                        rest.image = image!
                    } else {
                        print("error image nil")
                    }
                    
                    data.append(rest)
                    
                    self.presenter?.UpdateCartProducts(data: data)
                }
            }
            
        }
        
    }
    
    func AddCartProduct(ID: Int) -> Int {
        let count = storage.addExistProduct(productID: String(ID))
        
        return count
    }
    
    func RemoveCartProduct(ID: Int) -> Int {
        let count = storage.getProductCount(productID: String(ID))
                
        return storage.deleteProduct(productID: String(ID))
    }
}
