//
//  CartContracts.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 27.12.2020.
//

import UIKit

protocol PresenterToViewCartProtocol: class {
    func SetCartProducts(products: [CartProductData])
}

protocol ViewToPresenterCartProtocol: class {
    var view: PresenterToViewCartProtocol? { get set }
    var interactor: PresenterToInteractorCartProtocol? { get set }
    var router: PresenterToRouterCartProtocol? { get set }
    
    func viewDidLoad()
}

protocol PresenterToInteractorCartProtocol: class {
    var presenter: InteractorToPresenterCartProtocol? { get set }
    
    func LoadCartProducts()
}

protocol InteractorToPresenterCartProtocol: class {
    func UpdateCartProducts(data: [CartProductData])
}

protocol PresenterToRouterCartProtocol: class {
    static func createView() -> UIViewController
}
