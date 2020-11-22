//
//  CategoryCell.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import UIKit

struct CategoryData {
    var title: String
    var info: String
    var url: String
    var backgroundImage: UIImage
}

class CategoryCell: UICollectionViewCell {
    var data: CategoryData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
            title.text = data.title
            info.text = data.info
            
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        
        return iv
    }()
    
    let title = Title(text: "", font: UIFont(name: "Arial", size: 25)!)
    let info = Title(text: "", font: UIFont(name: "Arial", size: 15)!)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60).isActive = true
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 5).isActive = true
        
        contentView.addSubview(info)
        info.translatesAutoresizingMaskIntoConstraints = false
        info.topAnchor.constraint(equalTo: bg.bottomAnchor, constant: 10).isActive = true
        info.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
