//
//  CartRouter.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 27.12.2020.
//

import UIKit

class CartRouter {
    
}

extension CartRouter: PresenterToRouterCartProtocol {
    static func createView() -> UIViewController {
        let view = CartViewController()
        let presenter = CartPresenter()
        
        view.presenter = presenter
        view.presenter?.router = CartRouter()
        view.presenter?.view = view
        view.presenter?.interactor = CartInteractor()
        view.presenter?.interactor?.presenter = presenter
        
        return view
    }
}
