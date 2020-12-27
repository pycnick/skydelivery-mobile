//
//  RestaurantPresenter.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import Foundation

class RestaurantPresenter {
    var view: PresenterToViewRestaurantProtocol?
    var interactor: PresenterToInteractorRestaurantProtocol?
    var router: PresenterToRouterRestaurantProtocol?
}

extension RestaurantPresenter: ViewToPresenterRestaurantProtocol {
    func viewDidLoad(req: GetProductsRequest) {
        interactor?.LoadProducts(req: req)
    }
}

extension RestaurantPresenter: InteractorToPresenterRestaurantProtocol {
    func UpdateProducts(data: [ProductData]) {
        view?.SetProducts(products: data)
    }
}
