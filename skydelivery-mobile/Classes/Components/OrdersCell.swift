//
//  OrdersCell.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//
//ID <- map["id"]
//RestID <- map["restId"]
//Address <- map["address"]
//Products <- map["products"]
//Price <- map["price"]
//Created <- map["created_at"]
//Status <- map["status"]

import UIKit

struct HistoryData {
    var ID: Int
    var RestID: Int
    var Address: String
    var Products: [Product]
    var Price: Float
    var Created: String
    var Status: String
}

class HistoryCell: UICollectionViewCell {
    var data: HistoryData? {
        didSet {
            guard let data = data else { return }
            
            switch data.Status {
            case "Accepted":
                bg.image = UIImage(#imageLiteral(resourceName: "icons8-process"))
            case "Done":
                bg.image = UIImage(#imageLiteral(resourceName: "icons8-ok"))
            default:
                bg.image = UIImage(#imageLiteral(resourceName: "icons8-delivery"))
            }
            
            address.text = data.Address
            price.text = String(data.Price)
        }
    }
    
    fileprivate let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.clipsToBounds = true
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 40
        iv.layer.shadowRadius = 2
        
        return iv
    }()
    
    var address = Title(text: "", font: UIFont(name: "Arial", size: 20)!)
    var price = Title(text: "", font: UIFont(name: "Arial", size: 20)!)

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
    
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.leftAnchor, constant: 120).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true

        
        contentView.addSubview(address)
        address.translatesAutoresizingMaskIntoConstraints = false
        address.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
//        address.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        address.leftAnchor.constraint(equalTo: bg.rightAnchor, constant: 30).isActive = true
        address.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        
        contentView.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
//        price.topAnchor.constraint(equalTo: address.bottomAnchor).isActive = true
        price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        price.leftAnchor.constraint(equalTo: bg.rightAnchor, constant: 30).isActive = true
        price.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
