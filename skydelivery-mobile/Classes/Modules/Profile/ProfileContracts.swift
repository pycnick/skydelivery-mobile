//
//  ProfileContracts.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import UIKit

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorProfileProtocol: class {
    var presenter: InteractorToPresenterProfileProtocol? { get set }

    func LoadProfile()
}

protocol InteractorToPresenterProfileProtocol: class {
    func ShowProfile(profile: ProfileData)
    func ShowLogin()
}

protocol PresenterToViewProfileProtocol: class {
    func SetProfile(profile: ProfileData)
    func ShowLogin()
}

protocol ViewToPresenterProfileProtocol: class {
    
    var view: PresenterToViewProfileProtocol? { get set }
    var interactor: PresenterToInteractorProfileProtocol? { get set }
    var router: PresenterToRouterProfileProtocol? { get set }
    
    func viewDidLoad()
}

protocol PresenterToRouterProfileProtocol: class {
    static func createModule() -> UIViewController
}

