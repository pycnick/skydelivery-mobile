//
//  OrderContracts.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 28.12.2020.
//

import UIKit

protocol PresenterToViewOrderProtocol: class {

}

protocol ViewToPresenterOrderProtocol: class {
    var view: PresenterToViewOrderProtocol? { get set }
    var interactor: PresenterToInteractorOrderProtocol? { get set }
    var router: PresenterToRouterOrderProtocol? { get set }
    
    func viewDidLoad()
}

protocol PresenterToInteractorOrderProtocol: class {
    var presenter: InteractorToPresenterOrderProtocol? { get set }
}

protocol InteractorToPresenterOrderProtocol: class {
    
}

protocol PresenterToRouterOrderProtocol: class {
    static func createView() -> UIViewController
}
