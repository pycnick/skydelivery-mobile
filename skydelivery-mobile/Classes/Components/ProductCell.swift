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
            
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 12
        iv.layer.shadowRadius = 2
        
        return iv
    }()
    
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
        }
        
        setupOrderedProduct()
    }
    
    fileprivate let submit = Button(title: "Заказать", font: UIFont(name: "Arial", size: 20)!)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        contentView.layer.shadowOpacity = 0.7
        contentView.layer.shadowRadius = 4.0
        
        submit.addTarget(self, action: #selector(self.order), for: .touchUpInside)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100).isActive = true
        
        if let count = data?.countAdded {
            if count > 0 {
                setupOrderedProduct()
                
                return
            }
        }
        
        contentView.addSubview(submit)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -90).isActive = true
        submit.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        submit.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        submit.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        
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
        rmv.backgroundColor = .blue
        rmv.layer.cornerRadius = 8
        rmv.translatesAutoresizingMaskIntoConstraints = false
        rmv.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40).isActive = true
        rmv.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 15).isActive = true
        rmv.addTarget(self, action: #selector(removeOne), for: .touchUpInside)
        
        contentView.addSubview(count)
        count.translatesAutoresizingMaskIntoConstraints = false
        count.leftAnchor.constraint(equalTo: rmv.rightAnchor, constant: 20).isActive = true
        count.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 20).isActive = true
        count.font = UIFont(name: "Arial", size: 20)
        
        if let countProducts = data?.countAdded {
            self.count.text = String(countProducts)
        }
        
        contentView.addSubview(add)
        add.setTitle("+", for: .normal)
        add.backgroundColor = .blue
        add.layer.cornerRadius = 8
        add.translatesAutoresizingMaskIntoConstraints = false
        add.leftAnchor.constraint(equalTo: count.rightAnchor, constant: 20).isActive = true
        add.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 15).isActive = true
        add.addTarget(self, action: #selector(addOne), for: .touchUpInside)
    }
    
    func backToOrderButton() {
        rmv.removeFromSuperview()
        count.removeFromSuperview()
        add.removeFromSuperview()
        
        contentView.addSubview(submit)
        submit.translatesAutoresizingMaskIntoConstraints = false
        submit.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -90).isActive = true
        submit.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        submit.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        submit.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
    }
}
