//
//  RestaurantRouter.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import UIKit

class RestaurantRouter: PresenterToRouterRestaurantProtocol {
    
    
    // MARK: Static methods
    static func createRestaurantModule(restaurant: Restaurant) -> UIViewController {
        let viewController = RestaurantsViewController(restaurant: restaurant)
        let presenter = RestaurantPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = RestaurantRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = RestaurantsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
