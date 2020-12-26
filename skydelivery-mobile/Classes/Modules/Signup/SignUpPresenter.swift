//
//  SignUpPresenter.swift
//  skydelivery-mobile
//
//  Created by pycnick on 26.12.2020.
//

import Foundation

class SignUpPresetnter {
    var view: PresenterToViewSignUpProtocol?
    var interactor: PresenterToInteractorSignUpProtocol?
    var router: PresenterToRouterSignUpProtocol?
}

extension SignUpPresetnter: InteractorToPresenterSignUpProtocol {
    func OnSuccessSignUp() {
        view?.removeSelfView()
    }
}

extension SignUpPresetnter: ViewToPresenterSignUpProtocol {
    func showSignUp(req: SignUpRequest) {
        interactor?.SignUp(request: req)
    }
}
