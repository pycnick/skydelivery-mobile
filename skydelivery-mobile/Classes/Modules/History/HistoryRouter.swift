//
//  HistoryRouter.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import UIKit

class HistoryRouter {
    
}

extension HistoryRouter: PresenterToRouterHistoryProtocol {
    static func createView() -> UIViewController {
        let viewController = HistoryViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter = HistoryPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HistoryRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HistoryInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
