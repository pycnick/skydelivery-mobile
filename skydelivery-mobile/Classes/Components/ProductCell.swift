//
//  RestaurantCell.swift
//  skydelivery-mobile
//
//  Created by pycnick on 22.11.2020.
//

import UIKit

struct ProductData {
    var title: String
    var url: String
    var backgroundImage: UIImage
}

class ProductCell: UICollectionViewCell {
    var data: RestaurantData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
            
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
