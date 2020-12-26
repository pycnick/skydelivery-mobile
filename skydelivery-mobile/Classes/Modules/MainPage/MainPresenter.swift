//
//  MainPresenter.swift
//  skydelivery-mobile
//
//  Created by pycnick on 20.11.2020.
//

import Foundation

class MainPresenter {
    
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
}

extension MainPresenter: ViewToPresenterMainProtocol {
    func viewDidLoad() {
        interactor?.LoadRestaurants()
        interactor?.LoadTags()
        interactor?.LoadRecommendations()
    }
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    func UpdateRestaurants(data: [RestaurantData]) {
        view?.SetRestaurants(restaurants: data)
    }
}
