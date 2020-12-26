//
//  RestaurantCell.swift
//  skydelivery-mobile
//
//  Created by pycnick on 22.11.2020.
//

import UIKit

struct ProductData {
    var name: String
    var id: Int
    var countAdded: Int
    var backgroundImage: UIImage
}

class ProductCell: UICollectionViewCell {
    var data: ProductData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
            
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 12
        
        return iv
    }()
    
    fileprivate let submit = Button(title: "Заказать", font: UIFont(name: "Arial", size: 20)!)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -80).isActive = true
        
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
