//
//  OrderContracts.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 28.12.2020.
//

import UIKit

protocol PresenterToViewOrderProtocol: class {
    func makeAlert(text: String)
    func closeView()
}

protocol ViewToPresenterOrderProtocol: class {
    var view: PresenterToViewOrderProtocol? { get set }
    var interactor: PresenterToInteractorOrderProtocol? { get set }
    var router: PresenterToRouterOrderProtocol? { get set }
    
    func checkoutOrder(order: OrderRequest)
}

protocol PresenterToInteractorOrderProtocol: class {
    var presenter: InteractorToPresenterOrderProtocol? { get set }
    
    func checkoutOrder(order: OrderRequest)
}

protocol InteractorToPresenterOrderProtocol: class {
    func closeOrder()
}

protocol PresenterToRouterOrderProtocol: class {
    static func createView(FullPrice: Int) -> UIViewController
}
