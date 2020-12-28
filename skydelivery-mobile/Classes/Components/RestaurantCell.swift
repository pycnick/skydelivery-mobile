//
//  RestaurantCell.swift
//  skydelivery-mobile
//
//  Created by pycnick on 22.11.2020.
//

import UIKit

struct RestaurantData {
    var name: String
    var id: Int
    var description: String
    var rating: Float
    var backgroundImage: UIImage
}

class RestaurantCell: UICollectionViewCell {
    var data: RestaurantData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
            title.text = data.name
            info.text = "☆ ".uppercased() + String(data.rating)
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 14
        
        return iv
    }()
    
    var container = UIView()
    
    let title = Title(text: "", font: UIFont.systemFont(ofSize: 20, weight: .light))
    let info = Title(text: "", font: UIFont.systemFont(ofSize: 15, weight: .light))
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        contentView.layer.cornerRadius = 14
    
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 8).isActive = true
        title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        contentView.addSubview(info)
        info.translatesAutoresizingMaskIntoConstraints = false
        info.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 13).isActive = true
        info.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
