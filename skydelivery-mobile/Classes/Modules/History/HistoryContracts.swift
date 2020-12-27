//
//  HistoryProtocols.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewHistoryProtocol: class {
    func OnSuccessHistory(orders: [HistoryData])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHistoryProtocol: class {
    
    var view: PresenterToViewHistoryProtocol? { get set }
    var interactor: PresenterToInteractorHistoryProtocol? { get set }
    var router: PresenterToRouterHistoryProtocol? { get set }
    
    func viewDidLoad()

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHistoryProtocol: class {
    var presenter: InteractorToPresenterHistoryProtocol? { get set }
    
    func LoadHistory()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHistoryProtocol: class {
    func OnSuccessHistory(orders: [HistoryData])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHistoryProtocol: class {
    static func createView() -> UIViewController
}
