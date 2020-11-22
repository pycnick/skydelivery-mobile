//
//  CartCell.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 22.11.2020.
//

import UIKit

struct CartProductData {
    var title: String
    var price: Float
    var count: Int
    var backgroundImage: UIImage
}

class CartCell: UICollectionViewCell {
    var data: CartProductData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
            title.text = data.title
            price.text = "\(data.price * Float(data.count)) ₽"
            count.text = "\(data.count)"
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        
        return iv
    }()
    
    lazy var title = UILabel()
    lazy var price = UILabel()
    lazy var count = UILabel()
    lazy var add = UIButton()
    lazy var rmv = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        contentView.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.heightAnchor.constraint(equalToConstant: 80).isActive = true
        bg.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: bg.rightAnchor).isActive = true
        title.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        title.font = UIFont(name: "Arial", size: 20)
        
        contentView.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        price.leftAnchor.constraint(equalTo: title.rightAnchor).isActive = true
        price.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        price.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        price.font = UIFont(name: "Arial", size: 20)
        price.textColor = .gray
        
        contentView.addSubview(rmv)
        rmv.setTitle("-", for: .normal)
        rmv.backgroundColor = .blue
        rmv.layer.cornerRadius = 8
        rmv.translatesAutoresizingMaskIntoConstraints = false
        rmv.leftAnchor.constraint(equalTo: count.rightAnchor).isActive = true
        rmv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentView.addSubview(add)
        
        contentView.addSubview(count)
        count.translatesAutoresizingMaskIntoConstraints = false
        count.leftAnchor.constraint(equalTo: add.rightAnchor).isActive = true
        count.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        count.font = UIFont(name: "Arial", size: 20)
        
        add.setTitle("+", for: .normal)
        add.backgroundColor = .blue
        add.layer.cornerRadius = 8
        add.translatesAutoresizingMaskIntoConstraints = false
        add.leftAnchor.constraint(equalTo: bg.rightAnchor).isActive = true
        add.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
