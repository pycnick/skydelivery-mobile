//
//  CategoryRouter.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import UIKit

class CategoryRouter: PresenterToRouterCategoryProtocol {
    // MARK: Static methods
    static func createModule(categoryId: Int) -> UIViewController {
        
        print("QuotesRouter creates the Quotes module.")
        let viewController = CategoryViewController()
        viewController.Id = categoryId
//        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter = CategoryPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CategoryRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CategoryInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
