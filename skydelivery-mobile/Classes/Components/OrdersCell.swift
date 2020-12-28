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
                bg.image = UIImage(#imageLiteral(resourceName: "cooking"))
                info.text = "Мы готовим ваш заказ"
            case "Done":
                bg.image = UIImage(#imageLiteral(resourceName: "done"))
                info.text = "Заказ доставлен"
            default:
                bg.image = UIImage(#imageLiteral(resourceName: "delivery"))
                info.text = "Заказ уже в пути"
            }
            
            
            address.text = data.Address
            price.text = String(data.Price) + " ₽"
            date.text = data.Created
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
    
    var address = Title(text: "", font: UIFont.systemFont(ofSize: 15, weight: .light))
    var price = Title(text: "", font: UIFont.systemFont(ofSize: 15, weight: .light))
    var info = Title(text: "", font: UIFont.systemFont(ofSize: 20, weight: .light))
    var date = Title(text: "", font: UIFont.systemFont(ofSize: 15, weight: .light))

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        contentView.addSubview(info)
        
        info.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        info.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
    
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 20).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        bg.rightAnchor.constraint(equalTo: bg.leftAnchor, constant: 40).isActive = true
        bg.bottomAnchor.constraint(equalTo: bg.topAnchor, constant: 40).isActive = true

        
        contentView.addSubview(address)
        address.translatesAutoresizingMaskIntoConstraints = false
        address.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true

        address.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 100).isActive = true
        address.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true

        
        contentView.addSubview(date)
        date.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 100).isActive = true
        date.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        
        contentView.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        price.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 100).isActive = true
        price.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
