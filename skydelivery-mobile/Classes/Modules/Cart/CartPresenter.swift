//
//  CartPresenter.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 27.12.2020.
//

import Foundation

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
}

extension CartPresenter: InteractorToPresenterCartProtocol {
    func UpdateCartProducts(data: [CartProductData]) {
        self.view?.SetCartProducts(products: data)
    }
}
