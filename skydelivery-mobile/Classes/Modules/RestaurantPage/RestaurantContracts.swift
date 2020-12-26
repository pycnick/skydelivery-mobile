//
//  RestaurantContracts.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewRestaurantProtocol: class {
    func SetProducts(products: [ProductData])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterRestaurantProtocol: class {
    
    var view: PresenterToViewRestaurantProtocol? { get set }
    var interactor: PresenterToInteractorRestaurantProtocol? { get set }
    var router: PresenterToRouterRestaurantProtocol? { get set }
    
    func viewDidLoad(req: GetProductsRequest)
//    func addProductToBasket()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorRestaurantProtocol: class {
    var presenter: InteractorToPresenterRestaurantProtocol? { get set }
    
    func LoadProducts(req: GetProductsRequest)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterRestaurantProtocol: class {
    func UpdateProducts(data: [ProductData])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterRestaurantProtocol: class {
    static func createRestaurantModule(restaurant: Restaurant) -> UIViewController

}
