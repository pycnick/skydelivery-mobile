//
//  OrderRouter.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 28.12.2020.
//

import UIKit

class OrderRouter {
    
}

extension OrderRouter: PresenterToRouterOrderProtocol {
    static func createView(FullPrice: Int) -> UIViewController {
        let view = OrderViewController(FullPrice: FullPrice)
        let presenter = OrderPresenter()
        
        view.presenter = presenter
        view.presenter?.router = OrderRouter()
        view.presenter?.view = view
        view.presenter?.interactor = OrderInteractor()
        view.presenter?.interactor?.presenter = presenter
        
        return view
        
    }
}
