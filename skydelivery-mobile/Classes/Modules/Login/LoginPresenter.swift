//
//  LoginPresenter.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 27.12.2020.
//

import Foundation

class LogInPresetnter {
    var view: PresenterToViewLogInProtocol?
    var interactor: PresenterToInteractorLogInProtocol?
    var router: PresenterToRouterLogInProtocol?
}

extension LogInPresetnter: InteractorToPresenterLogInProtocol {
    func OnSuccessLogIn(profile: ProfileData) {
        view?.OnSuccessLogIn(profile: profile)
    }
}

extension LogInPresetnter: ViewToPresenterLogInProtocol {
    func showLogIn(req: LogInRequest) {
        interactor?.LogIn(request: req)
    }
}
