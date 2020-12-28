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
    
    func viewDidLoad() {
    }
}

extension OrderPresenter : InteractorToPresenterOrderProtocol {
    
}
