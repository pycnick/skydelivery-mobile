//
//  LoginRouter.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 27.12.2020.
//

import Foundation

import UIKit

class LogInRouter {
    
}

extension LogInRouter: PresenterToRouterLogInProtocol {
    static func createView() -> UIView {
        let view = LoginView()
        let presenter = LogInPresetnter()
        
        view.presenter = presenter
        view.presenter?.router = LogInRouter()
        view.presenter?.view = view
        view.presenter?.interactor = LogInInteractor()
        view.presenter?.interactor?.presenter = presenter
        
        return view
        
    }
    
    func reloadMainPage() {
        
    }
}
