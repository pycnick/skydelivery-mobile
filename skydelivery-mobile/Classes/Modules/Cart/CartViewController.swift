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
                
                self.setupUI()
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
    
    lazy var cartLabel = Title(text: "Корзина 🛒", font: UIFont.systemFont(ofSize: 40, weight: .light))
    lazy var cartCollection = CartCollection()
    lazy var cartSubmit = UIButton()
    lazy var cartSubmitLabel = Title(text: "Оформить заказ", font: UIFont.systemFont(ofSize: 20, weight: .light))
    lazy var cartPriceLabel = Title(text: "0 ₽", font: UIFont.systemFont(ofSize: 20, weight: .light))
    
    func AlertDelete(cell: UICollectionViewCell) {
        let indexPath = self.cartCollection.indexPath(for: cell)!
        let ID = self.cartCollection.data[indexPath.row].product.ID!
        
        let alert = UIAlertController(
            title: "Удаление товара",
            message: "Вы действительно хотите удалить товар \'\(self.cartCollection.data[indexPath.row].product.Name!)\' из корзины?",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            self.cartCollection.data.remove(at: indexPath.row)

            self.cartCollection.performBatchUpdates({
                self.cartCollection.deleteItems(at: [indexPath])
            }, completion: nil)
            
            let count = self.presenter!.RemoveCartProduct(ID: ID)
            
            for index in 0..<self.cartCollection.data.count {
                if self.cartCollection.data[index].product.ID == ID {
                    self.cartCollection.data[index].count = count
                }
            }
            
            self.UpdateFullPrice()
            self.cartCollection.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func OpenOrder() {
        self.navigationController?.pushViewController(OrderRouter.createView(FullPrice: fullPrice ?? 0), animated: true)
    }
}

extension CartViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        
        self.view.addSubview(cartLabel)
        cartLabel.translatesAutoresizingMaskIntoConstraints = false
        cartLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        cartLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        cartLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        if cartCollection.data.isEmpty {
            let emptyLabel = UILabel()
            self.view.addSubview(emptyLabel)
            emptyLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
            emptyLabel.numberOfLines = 3
            emptyLabel.text = "Корзина пуста"

            emptyLabel.translatesAutoresizingMaskIntoConstraints = false
            emptyLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            emptyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

            return
        }
        
        self.view.addSubview(cartCollection)
        cartCollection.controller = self
        cartCollection.translatesAutoresizingMaskIntoConstraints = false
        cartCollection.topAnchor.constraint(equalTo: cartLabel.bottomAnchor, constant: 20).isActive = true
        cartCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        cartCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        cartCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.view.addSubview(cartSubmit)
        cartSubmit.addTarget(self, action: #selector(self.OpenOrder), for: .touchUpInside)
        cartSubmit.translatesAutoresizingMaskIntoConstraints = false
        cartSubmit.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        cartSubmit.topAnchor.constraint(equalTo: cartSubmit.bottomAnchor, constant: -80).isActive = true
        cartSubmit.bottomAnchor.constraint(equalTo: cartSubmit.topAnchor, constant: 40).isActive = true
        cartSubmit.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        cartSubmit.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        cartSubmit.backgroundColor = .systemBlue
        cartSubmit.layer.cornerRadius = 12
        
        cartSubmit.addSubview(cartSubmitLabel)
        cartSubmitLabel.translatesAutoresizingMaskIntoConstraints = false
        cartSubmitLabel.leftAnchor.constraint(equalTo: cartSubmit.leftAnchor, constant: 20).isActive = true
        cartSubmitLabel.centerYAnchor.constraint(equalTo: cartSubmit.centerYAnchor).isActive = true
        cartSubmitLabel.textColor = .white
        
        cartSubmit.addSubview(cartPriceLabel)
        cartPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        cartPriceLabel.rightAnchor.constraint(equalTo: cartSubmit.rightAnchor, constant: -20).isActive = true
        cartPriceLabel.centerYAnchor.constraint(equalTo: cartSubmit.centerYAnchor).isActive = true
        cartPriceLabel.textColor = .white
    }
}

extension CartViewController: PresenterToViewCartProtocol {
    func SetCartProducts(products: [CartProductData]) {
        self.cartCollection.SetData(data: products)
        
        var temp = 0
        products.forEach { (data: CartProductData) in
            temp += Int(data.product.Price!) * data.count
        }

        self.fullPrice = temp
        self.setupUI()
    }
    
    func UpdateFullPrice() {
        var temp = 0
        cartCollection.data.forEach { (data: CartProductData) in
            temp += Int(data.product.Price!) * data.count
        }
        
        self.fullPrice = temp
    }
}

extension CartViewController: CartCellDelegate {
    func addOne(cell: UICollectionViewCell) {
        let index = self.cartCollection.indexPath(for: cell)!.row
        let ID = self.cartCollection.data[index].product.ID!
        let count = presenter!.AddCartProduct(ID: ID)
        
        for index in 0..<self.cartCollection.data.count {
            if self.cartCollection.data[index].product.ID == ID {
                self.cartCollection.data[index].count = count
            }
        }
                
        self.UpdateFullPrice()
        self.cartCollection.reloadData()
    }
    
    func removeOne(cell: UICollectionViewCell) {
        let index = self.cartCollection.indexPath(for: cell)!.row
        let ID = self.cartCollection.data[index].product.ID!
        if self.cartCollection.data[index].count - 1 <= 0 {
            AlertDelete(cell: cell)
            
            return
        }
        
        let count =  presenter!.RemoveCartProduct(ID: ID)
        
        for index in 0..<self.cartCollection.data.count {
            if self.cartCollection.data[index].product.ID == ID {
                self.cartCollection.data[index].count = count
            }
        }
        
        self.UpdateFullPrice()
        self.cartCollection.reloadData()
    }
}
