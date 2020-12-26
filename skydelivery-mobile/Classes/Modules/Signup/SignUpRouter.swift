//
//  SignUpRouter.swift
//  skydelivery-mobile
//
//  Created by pycnick on 26.12.2020.
//

import UIKit

class SignUpRouter {
    
}

extension SignUpRouter: PresenterToRouterSignUpProtocol {
    static func createView() -> UIView {
        let view = SignUpView()
        let presenter = SignUpPresetnter()
        
        view.presenter = presenter
        view.presenter?.router = SignUpRouter()
        view.presenter?.view = view
        view.presenter?.interactor = SignUpInteractor()
        view.presenter?.interactor?.presenter = presenter
        
        return view
        
    }
    
    func reloadMainPage() {
        
    }
}
