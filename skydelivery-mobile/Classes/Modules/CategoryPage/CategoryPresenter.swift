//
//  CategoryPresenter.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import Foundation

class CategoryPresenter {
    
    var view: PresenterToViewCategoryProtocol?
    var interactor: PresenterToInteractorCategoryProtocol?
    var router: PresenterToRouterCategoryProtocol?
}

extension CategoryPresenter: ViewToPresenterCategoryProtocol {
    func viewDidLoad(id: Int) {
        interactor?.LoadRestaurnatByCategory(id: id)
    }
}


extension CategoryPresenter: InteractorToPresenterCategoryProtocol {
    func ShowRestaurnatsByTag(data: [RestaurantData]) {
        view?.SetRestaurants(data: data)
    }
}
