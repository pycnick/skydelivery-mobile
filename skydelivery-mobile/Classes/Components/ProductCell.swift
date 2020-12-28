//
//  RestaurantCell.swift
//  skydelivery-mobile
//
//  Created by pycnick on 22.11.2020.
//

import UIKit

struct ProductData {
    var restid: Int
    var name: String
    var id: Int
    var countAdded: Int
    var backgroundImage: UIImage
}

class ProductCell: UICollectionViewCell {
    
    var localStorage = OrderStorage.shared
    
    var data: ProductData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
            title.text = data.name
            price.text = "200" + " ₽"
            
            if data.countAdded > 0 {
                count.text = String(data.countAdded)
                setupOrderedProduct()
                
                return
            }
            
            contentView.addSubview(submit)
            submit.translatesAutoresizingMaskIntoConstraints = false
            submit.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 15).isActive = true
            submit.bottomAnchor.constraint(equalTo: submit.topAnchor, constant: 50).isActive = true
            submit.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: -60).isActive = true
            submit.rightAnchor.constraint(equalTo: submit.leftAnchor, constant: 50).isActive = true
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 14
        iv.layer.shadowRadius = 2
        
        return iv
    }()
    
    let title = Title(text: "", font: UIFont.systemFont(ofSize: 20, weight: .light))
    let price = Title(text: "", font: UIFont.systemFont(ofSize: 20, weight: .light))
    
    @objc func removeOne() {
        self.data?.countAdded -= 1
        if let product = self.data {
            localStorage.deleteProduct(productID: String(product.id))
        }
        if let count = self.data?.countAdded {
            if count == 0 {
                backToOrderButton()
                
                return
            }
            
            self.count.text = String(count)
        }
    }
    
    @objc func addOne() {
        self.data?.countAdded += 1
        
        if let product = self.data {
            localStorage.addProduct(productID: String(product.id))
            localStorage.setRestaurantID(RestID: product.restid)
        }
        
        if let count = self.data?.countAdded {
            self.count.text = String(count)
        }
    }
    
    lazy var rmv = UIButton()
    lazy var count = UILabel()
    lazy var add = UIButton()
    
    @objc func order() {
        data?.countAdded = 1
        
        if let product = self.data {
            localStorage.addProduct(productID: String(product.id))
            localStorage.setRestaurantID(RestID: product.restid)
        }
        
        setupOrderedProduct()
    }
    
    fileprivate let submit = Button(title: "❤️", font: UIFont(name: "Arial", size: 10)!)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        contentView.layer.cornerRadius = 14
        
//        contentView.layer.shadowColor = UIColor.black.cgColor
//        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
//        contentView.layer.shadowOpacity = 0.7
//        contentView.layer.shadowRadius = 4.0
        
        submit.addTarget(self, action: #selector(self.order), for: .touchUpInside)
        
        contentView.addSubview(bg)
        contentView.addSubview(title)
        contentView.addSubview(price)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -80).isActive = true
        
        title.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 10).isActive = true
        title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        price.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCell {
    func setupOrderedProduct() {
        submit.removeFromSuperview()
        
        contentView.addSubview(rmv)
        rmv.setTitle("-", for: .normal)
        rmv.backgroundColor = .systemBlue
        rmv.layer.cornerRadius = 8
        rmv.translatesAutoresizingMaskIntoConstraints = false
//        rmv.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40).isActive = true
//        rmv.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 15).isActive = true
        rmv.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: -100).isActive = true
        rmv.rightAnchor.constraint(equalTo: rmv.leftAnchor, constant: 30).isActive = true
        rmv.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 40).isActive = true
        rmv.bottomAnchor.constraint(equalTo: rmv.topAnchor, constant: 30).isActive = true
        rmv.addTarget(self, action: #selector(removeOne), for: .touchUpInside)
        
        contentView.addSubview(count)
        count.translatesAutoresizingMaskIntoConstraints = false
//        count.leftAnchor.constraint(equalTo: rmv.rightAnchor, constant: 20).isActive = true
//        count.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 20).isActive = true
        count.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: -60).isActive = true
//        rmv.rightAnchor.constraint(equalTo: rmv.leftAnchor, constant: 30).isActive = true
        count.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 45).isActive = true
//        count.bottomAnchor.constraint(equalTo: rmv.topAnchor, constant: 30).isActive = true
        
        count.font = UIFont(name: "Arial", size: 20)
        
        if let countProducts = data?.countAdded {
            self.count.text = String(countProducts)
        }
        
        contentView.addSubview(add)
        add.setTitle("+", for: .normal)
        add.backgroundColor = .systemBlue
        add.layer.cornerRadius = 8
        add.translatesAutoresizingMaskIntoConstraints = false
//        add.leftAnchor.constraint(equalTo: count.rightAnchor, constant: 20).isActive = true
//        add.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 15).isActive = true
        
        add.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40).isActive = true
        add.rightAnchor.constraint(equalTo: add.leftAnchor, constant: 30).isActive = true
        add.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 40).isActive = true
        add.bottomAnchor.constraint(equalTo: add.topAnchor, constant: 30).isActive = true

        add.addTarget(self, action: #selector(addOne), for: .touchUpInside)
    }
    
    func backToOrderButton() {
        rmv.removeFromSuperview()
        count.removeFromSuperview()
        add.removeFromSuperview()
        
        contentView.addSubview(submit)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 15).isActive = true
        submit.bottomAnchor.constraint(equalTo: submit.topAnchor, constant: 50).isActive = true
        submit.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: -60).isActive = true
        submit.rightAnchor.constraint(equalTo: submit.leftAnchor, constant: 50).isActive = true
    }
}
