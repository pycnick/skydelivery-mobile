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
    }
    
    init(restaurant: Restaurant) {
        super.init(nibName: nil, bundle: nil)
        self.restaurant = restaurant
        self.restaurantsLabel = Title(text: restaurant.Name, font: UIFont(name: "Arial", size: 40)!)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Properties
    var restaurantsLabel: Title?
    var restaurant: Restaurant?
}

extension RestaurantsViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        
        view.backgroundColor = .white
        self.view.addSubview(restaurantsLabel!)
        restaurantsLabel!.translatesAutoresizingMaskIntoConstraints = false
        restaurantsLabel!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        restaurantsLabel!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        restaurantsLabel!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        let products = ProductsCarousel(callback: {print("products callback")})
        view.addSubview(products)
        products.backgroundColor = .white
        products.translatesAutoresizingMaskIntoConstraints = false
        products.topAnchor.constraint(equalTo: restaurantsLabel!.bottomAnchor).isActive = true
        products.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        products.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        products.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
