//
//  CartViewController.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 22.11.2020.
//

import UIKit

class CartControllerView : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    lazy var cartLabel = Title(text: "Корзина", font: UIFont(name: "Arial", size: 40)!)
    lazy var cartCollection = CartCollection()
}

extension CartControllerView {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        cartCollection.controller = self
        
        self.view.addSubview(cartLabel)
        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        cartLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        cartLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        cartLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(cartCollection)
        cartCollection.translatesAutoresizingMaskIntoConstraints = false
        cartCollection.topAnchor.constraint(equalTo: cartLabel.bottomAnchor, constant: 20).isActive = true
        cartCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cartCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cartCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
