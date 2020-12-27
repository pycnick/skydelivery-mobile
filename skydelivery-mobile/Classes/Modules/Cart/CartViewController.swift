//
//  CartViewController.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 22.11.2020.
//

import UIKit

class CartViewController : UIViewController {
    var fullPrice : Int? {
        didSet {
            if fullPrice == 0 {
                self.cartSubmit.removeFromSuperview()
                
                return
            }
            cartPriceLabel.text = "\(fullPrice ?? 0) ₽"
        }
    }
    
    var presenter: ViewToPresenterCartProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    lazy var cartLabel = Title(text: "Корзина", font: UIFont(name: "Arial", size: 40)!)
    lazy var cartCollection = CartCollection()
    lazy var cartSubmit = UIButton()
    lazy var cartSubmitLabel = Title(text: "Оформить заказ", font: UIFont(name: "Arial", size: 18)!)
    lazy var cartPriceLabel = Title(text: "0 ₽", font: UIFont(name: "Arial", size: 18)!)
    
//    public func refreshFullPrice() {
//        var temp = 0
//        cartCollection.data.forEach { (data: CartProductData) in
//            temp += data.price * data.count
//        }
//
//        fullPrice = temp
//    }
}

extension CartViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        
        self.view.addSubview(cartLabel)
        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        cartLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        cartLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        cartLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
//        if cartCollection.data.isEmpty {
//            let emptyLabel = UILabel()
//            self.view.addSubview(emptyLabel)
//            emptyLabel.font = UIFont(name: "Arial", size: 20)
//            emptyLabel.numberOfLines = 3
//            emptyLabel.text = "Корзина пуста"
//
//            emptyLabel.translatesAutoresizingMaskIntoConstraints = false
//            emptyLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//            emptyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//
//            return
//        }
        
        self.view.addSubview(cartCollection)
        cartCollection.translatesAutoresizingMaskIntoConstraints = false
        cartCollection.topAnchor.constraint(equalTo: cartLabel.bottomAnchor, constant: 20).isActive = true
        cartCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cartCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        cartCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.view.addSubview(cartSubmit)
        cartSubmit.translatesAutoresizingMaskIntoConstraints = false
        cartSubmit.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        cartSubmit.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        cartSubmit.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        cartSubmit.backgroundColor = .systemBlue
        cartSubmit.layer.cornerRadius = 8
        
        cartSubmit.addSubview(cartSubmitLabel)
        cartSubmitLabel.translatesAutoresizingMaskIntoConstraints = false
        cartSubmitLabel.leftAnchor.constraint(equalTo: cartSubmit.leftAnchor, constant: 10).isActive = true
        cartSubmitLabel.centerYAnchor.constraint(equalTo: cartSubmit.centerYAnchor).isActive = true
        cartSubmitLabel.textColor = .white
        
        cartSubmit.addSubview(cartPriceLabel)
        cartPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        cartPriceLabel.rightAnchor.constraint(equalTo: cartSubmit.rightAnchor, constant: -10).isActive = true
        cartPriceLabel.centerYAnchor.constraint(equalTo: cartSubmit.centerYAnchor).isActive = true
        cartPriceLabel.textColor = .white
    }
}

extension CartViewController: PresenterToViewCartProtocol {
    func SetCartProducts(products: [CartProductData]) {
        self.cartCollection.SetData(data: products)
    }
}
