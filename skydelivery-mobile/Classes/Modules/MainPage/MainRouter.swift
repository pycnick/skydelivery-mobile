//
//  MainRouter.swift
//  skydelivery-mobile
//
//  Created by pycnick on 20.11.2020.
//

import UIKit

class MainRouter: PresenterToRouterMainProtocol {
    
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        print("QuotesRouter creates the Quotes module.")
        let viewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        let presenter = MainPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MainRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MainInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
//    // MARK: - Navigation
//    func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: Quote) {
//        print("QuotesRouter is instructed to push QuoteDetailViewController onto the navigation stack.")
//        let quoteDetailViewController = QuoteDetailRouter.createModule(with: quote)
//
//        let viewController = view as! QuotesViewController
//        viewController.navigationController?
//            .pushViewController(quoteDetailViewController, animated: true)
//
//    }
    
}
