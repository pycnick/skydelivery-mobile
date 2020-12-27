//
//  CategoryContracts.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import UIKit

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCategoryProtocol: class {
    var presenter: InteractorToPresenterCategoryProtocol? { get set }

    func LoadRestaurnatByCategory(id: Int)
}

protocol InteractorToPresenterCategoryProtocol: class {
    func ShowRestaurnatsByTag(data: [RestaurantData])
}

protocol PresenterToViewCategoryProtocol: class {
    func SetRestaurants(data: [RestaurantData])
}

protocol ViewToPresenterCategoryProtocol: class {
    
    var view: PresenterToViewCategoryProtocol? { get set }
    var interactor: PresenterToInteractorCategoryProtocol? { get set }
    var router: PresenterToRouterCategoryProtocol? { get set }
    
    func viewDidLoad(id: Int)

}

protocol PresenterToRouterCategoryProtocol: class {
    static func createModule(categoryId: Int) -> UIViewController
}

