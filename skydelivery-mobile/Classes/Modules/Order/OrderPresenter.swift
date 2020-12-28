//
//  OrderPresenter.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 28.12.2020.
//

import Foundation

class OrderPresenter {
    var view : PresenterToViewOrderProtocol?
    var interactor : PresenterToInteractorOrderProtocol?
    var router : PresenterToRouterOrderProtocol?
}

extension OrderPresenter : ViewToPresenterOrderProtocol {
    
    func checkoutOrder(order: OrderRequest) {
        if order.Address == "" {
            self.view?.makeAlert(text: "Необходимо ввести адрес доставки")
            return
        }
        
        if order.Phone == "" {
            self.view?.makeAlert(text: "Необходимо ввести номер телефона")
            return
        }
        
        self.interactor?.checkoutOrder(order: order)
    }
}

extension OrderPresenter : InteractorToPresenterOrderProtocol {
    func closeOrder() {
        self.view?.closeView()
    }
}
