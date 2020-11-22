//
//  CartCollection.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 22.11.2020.
//

import UIKit

class CartCollection : UICollectionView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        super.init(frame: .zero, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(CartCell.self, forCellWithReuseIdentifier: "cell")
//        self.backgroundColor = .white
        
        self.delegate = self
        self.dataSource = self
    }
    
    var data = [
        CartProductData(title: "Product 1", price: 10.0, count: 1, backgroundImage: #imageLiteral(resourceName: "default")),
        CartProductData(title: "Product 2", price: 20.0, count: 2, backgroundImage: #imageLiteral(resourceName: "default"))
    ]
    
}

extension CartCollection: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CartCell
        cell.data = self.data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/6)
    }
}
