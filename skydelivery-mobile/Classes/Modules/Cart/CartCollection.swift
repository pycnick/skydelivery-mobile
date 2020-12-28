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
        self.backgroundColor = .white
        
        self.delegate = self
        self.dataSource = self
    }
    
    weak var controller: CartViewController?
    
    var data: [CartProductData] = []
    
    func SetData(data: [CartProductData]) {
        self.data.removeAll()
        self.data = data
        
        self.reloadData()
    }
}

extension CartCollection: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CartCell
        cell.data = self.data[indexPath.item]
        cell.delegate = controller
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/6)
    }
}
