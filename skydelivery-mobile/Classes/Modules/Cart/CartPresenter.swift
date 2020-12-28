//
//  CartPresenter.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 27.12.2020.
//

import UIKit

class CartPresenter {
    var view: PresenterToViewCartProtocol?
    var interactor: PresenterToInteractorCartProtocol?
    var router: PresenterToRouterCartProtocol?
    
    var api = ApiManager.shared
}

extension CartPresenter: ViewToPresenterCartProtocol {
    func viewDidLoad() {
        self.api.IsAuthenticated { (state) in
            if state {
                self.interactor?.LoadCartProducts()
            }
        }
    }
    
    func AddCartProduct(ID: Int) -> Int {
        return interactor!.AddCartProduct(ID: ID)
    }
    
    func RemoveCartProduct(ID: Int) -> Int {
        return interactor!.RemoveCartProduct(ID: ID)
    }
}

extension CartPresenter: InteractorToPresenterCartProtocol {
    func UpdateCartProducts(data: [CartProductData]) {
        self.view?.SetCartProducts(products: data)
    }
    
}
