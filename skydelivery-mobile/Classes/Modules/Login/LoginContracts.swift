//
//  LoginContracts.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 27.12.2020.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewLogInProtocol: class {
    func OnSuccessLogIn(profile: ProfileData)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterLogInProtocol: class {
    
    var view: PresenterToViewLogInProtocol? { get set }
    var interactor: PresenterToInteractorLogInProtocol? { get set }
    var router: PresenterToRouterLogInProtocol? { get set }
    
    func showLogIn(req: LogInRequest)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorLogInProtocol: class {
//
    var presenter: InteractorToPresenterLogInProtocol? { get set }
    
    func LogIn(request: LogInRequest)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterLogInProtocol: class {
    
    func OnSuccessLogIn(profile: ProfileData)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterLogInProtocol: class {
    static func createView() -> UIView

}
