//
//  ProfileRouter.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//


import UIKit

class ProfileRouter: PresenterToRouterProfileProtocol {
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        print("QuotesRouter creates the Quotes module.")
        let viewController = ProfileViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter = ProfilePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ProfileRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ProfileInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
