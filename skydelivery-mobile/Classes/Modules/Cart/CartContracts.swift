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
    func AddCartProduct(ID: Int) -> Int
    func RemoveCartProduct(ID: Int) -> Int
}

protocol PresenterToInteractorCartProtocol: class {
    var presenter: InteractorToPresenterCartProtocol? { get set }
    
    func LoadCartProducts()
    func AddCartProduct(ID: Int) -> Int
    func RemoveCartProduct(ID: Int) -> Int
}

protocol InteractorToPresenterCartProtocol: class {
    func UpdateCartProducts(data: [CartProductData])
}

protocol PresenterToRouterCartProtocol: class {
    static func createView() -> UIViewController
}

protocol CartCellDelegate: class {
    func addOne(cell: UICollectionViewCell)
    func removeOne(cell: UICollectionViewCell)
}
