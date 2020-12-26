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
    
    var api = ApiManager.shared
}

extension MainPresenter: ViewToPresenterMainProtocol {
    func viewDidLoad() {
        interactor?.LoadRestaurants()
        interactor?.LoadTags()
        
        self.api.IsAuthenticated { (state) in
            if state {
                self.interactor?.LoadRecommendations()
            }
        }
    }
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    func UpdateRestaurants(data: [RestaurantData]) {
        view?.SetRestaurants(restaurants: data)
    }
    
    func UpdateTags(data: [TagData]) {
        view?.SetTags(tags: data)
    }
    
    func UpdateRecommendations(data: [RestaurantData]) {
        view?.SetRecommendations(restaurants: data)
    }
}
