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
}

extension CartInteractor: PresenterToInteractorCartProtocol {
    func LoadCartProducts() {
        
    }
    
    func AddCartProduct(ID: Int) {
        
    }
    
    func RemoveCartProduct(ID: Int) {
        
    }
}
