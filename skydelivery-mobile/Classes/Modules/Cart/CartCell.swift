//
//  CartCell.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 22.11.2020.
//

import UIKit

struct CartProductData {
    var product: Product
    var image: UIImage
    var count: Int
}

class CartCell: UICollectionViewCell {
    var data: CartProductData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
            title.text = data.product.Name
            price.text = "\(Int(data.product.Price!) * data.count) ₽"
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
    
    weak var delegate: CartCellDelegate?
    
    lazy var title = UILabel()
    lazy var price = UILabel()
    lazy var count = UILabel()
    lazy var add = UIButton()
    lazy var rmv = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 14
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)

        
        contentView.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        bg.heightAnchor.constraint(equalToConstant: 80).isActive = true
        bg.widthAnchor.constraint(equalToConstant: 120).isActive = true
        bg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(price)
        price.translatesAutoresizingMaskIntoConstraints = false
        price.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
        price.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        price.font = UIFont.systemFont(ofSize: 20, weight: .light)
        price.textColor = .gray
        
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: bg.safeAreaLayoutGuide.rightAnchor, constant: 20).isActive = true
        title.rightAnchor.constraint(equalTo: price.safeAreaLayoutGuide.leftAnchor, constant: -20).isActive = true
        title.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        title.font = UIFont.systemFont(ofSize: 20, weight: .light)
        title.numberOfLines = 2
        
        contentView.addSubview(rmv)
        rmv.setTitle("-", for: .normal)
        rmv.backgroundColor = .systemBlue
        rmv.layer.cornerRadius = 8
        rmv.translatesAutoresizingMaskIntoConstraints = false
        rmv.leftAnchor.constraint(equalTo: bg.safeAreaLayoutGuide.rightAnchor, constant: 20).isActive = true
        rmv.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        rmv.rightAnchor.constraint(equalTo: rmv.leftAnchor, constant: 30).isActive = true
        rmv.topAnchor.constraint(equalTo: rmv.bottomAnchor, constant: -30).isActive = true
        rmv.addTarget(self, action: #selector(removeOne), for: .touchUpInside)
        
        contentView.addSubview(count)
        count.translatesAutoresizingMaskIntoConstraints = false
        count.leftAnchor.constraint(equalTo: rmv.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        count.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -23).isActive = true
        count.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        contentView.addSubview(add)
        add.setTitle("+", for: .normal)
        add.backgroundColor = .systemBlue
        add.layer.cornerRadius = 8
        add.translatesAutoresizingMaskIntoConstraints = false
        add.leftAnchor.constraint(equalTo: count.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        add.rightAnchor.constraint(equalTo: add.leftAnchor, constant: 30).isActive = true
        add.topAnchor.constraint(equalTo: add.bottomAnchor, constant: -30).isActive = true
        add.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        add.addTarget(self, action: #selector(addOne), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func addOne(sender: UIButton!) {
        self.delegate!.addOne(cell: self)
    }

    @objc
    private func removeOne(sender: UIButton!) {
        self.delegate!.removeOne(cell: self)
    }
}
