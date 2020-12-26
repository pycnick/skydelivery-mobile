//
//  ProfilePresenter.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import Foundation

class ProfilePresenter {
    
    var view: PresenterToViewProfileProtocol?
    var interactor: PresenterToInteractorProfileProtocol?
    var router: PresenterToRouterProfileProtocol?
}

extension ProfilePresenter: ViewToPresenterProfileProtocol {
    func viewDidLoad() {
        interactor?.LoadProfile()
    }
}

extension ProfilePresenter: InteractorToPresenterProfileProtocol {

    func ShowProfile(profile: ProfileData) {
        view?.SetProfile(profile: profile)
    }
    
    func ShowLogin() {
        view?.ShowLogin()
    }
}
