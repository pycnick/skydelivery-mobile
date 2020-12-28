//
//  RestaurantCell.swift
//  skydelivery-mobile
//
//  Created by pycnick on 22.11.2020.
//

import UIKit

struct TagData {
    var id: Int
    var title: String
}

class TagCell: UICollectionViewCell {
    var data: TagData? {
        didSet {
            guard let data = data else { return }
            bg.text = data.title
            
        }
    }
    
    fileprivate let bg: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 20)
        label.textAlignment = .center
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(bg)

        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12

//        bg.backgroundColor = UIColor.init(red: 246.0/255.0, green: 212.0/255.0, blue: 113.0/255.0, alpha: 1)
        bg.backgroundColor = UIColor.systemYellow
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
