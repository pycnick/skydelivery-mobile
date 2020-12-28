//
//  RestaurantsPageViewController.swift
//  skydelivery-mobile
//
//  Created by pycnick on 22.11.2020.
//

import UIKit

class RestaurantsViewController: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        if let id = self.restaurant?.ID {
            presenter?.viewDidLoad(req: GetProductsRequest(restaurant: id, page: 1, count: 10))
        }
        
        if let id = self.restaurant?.ID {
            let storageID = localStorage.getRestaurantID()
            if id != storageID {
                if !self.localStorage.isEmptyCart() {
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    init(restaurant: Restaurant) {
        super.init(nibName: nil, bundle: nil)
        self.restaurant = restaurant
        self.restaurantsLabel = Title(text: restaurant.Name!, font: UIFont.systemFont(ofSize: 30, weight: .light))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Properties
    var restaurantsLabel: Title?
    var restaurant: Restaurant?
    
    var products = ProductsCarousel(callback: {print("products callback")})
    
    var presenter: ViewToPresenterRestaurantProtocol?
    
    var localStorage = OrderStorage.shared
    
    lazy var alert = UIAlertController(
        title: "Очищение корзины",
        message: "Вы заказываете из нового ресторана. Очистить коризину?",
        preferredStyle: .alert
    )
}

extension RestaurantsViewController {
    func setupUI() {
//        overrideUserInterfaceStyle = .light
        
        view.backgroundColor = .white
        self.view.addSubview(restaurantsLabel!)
        restaurantsLabel!.translatesAutoresizingMaskIntoConstraints = false
        restaurantsLabel!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        restaurantsLabel!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        restaurantsLabel!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        view.addSubview(products)
        products.backgroundColor = .white
        products.translatesAutoresizingMaskIntoConstraints = false
        products.topAnchor.constraint(equalTo: restaurantsLabel!.bottomAnchor, constant: 20).isActive = true
        products.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        products.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        products.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            self.localStorage.cleanCart()
        }))
        
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))
    }
}

extension RestaurantsViewController: PresenterToViewRestaurantProtocol {
    func SetProducts(products: [ProductData]) {
        if products.isEmpty {
            self.products.removeFromSuperview()
            
            let emptyLabel = UILabel()
            self.view.addSubview(emptyLabel)
            emptyLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
            emptyLabel.numberOfLines = 3
            emptyLabel.text = "У ресторана пока еще нет продуктов"
            
            emptyLabel.translatesAutoresizingMaskIntoConstraints = false
            emptyLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            emptyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
            return
        }
        
        self.products.SetData(data: products)
    }
}
