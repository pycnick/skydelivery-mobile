//
//  Carousel.swift
//  skydelivery-mobile
//
//  Created by pycnick on 21.11.2020.
//

import UIKit

class ProductsCarousel: UICollectionView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(callback: (() -> ())?) {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
                
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(ProductCell.self, forCellWithReuseIdentifier: "cell")
        
        self.delegate = self
        self.dataSource = self
        
        self.callback = callback
    }
    
    var data = [ProductData]()
//        ProductData(name: "The Islands!", id: 1, countAdded: 1, backgroundImage: #imageLiteral(resourceName: "mcdonalds-Double-Big-Mac")),
//        ProductData(name: "Subscribe to maxcodes boiiii!", id: 1, countAdded: 1, backgroundImage: #imageLiteral(resourceName: "obedy-v-ofis-vkusnaya-i-polnocennaya-eda-vo-vremya-obedennogo-pereryva")),
//        ProductData(name: "StoreKit Course!", id: 1, countAdded: 1, backgroundImage: #imageLiteral(resourceName: "mcdonalds-The-Jerk-Chicken-Sandwhich")),
//        ProductData(name: "Collection Views!", id: 1, countAdded: 1, backgroundImage: #imageLiteral(resourceName: "mcdonalds-Hot-Chocolate-Regular")),
//        ProductData(name: "MapKit!", id: 1, countAdded: 1, backgroundImage: #imageLiteral(resourceName: "270718"))
    
    
    func SetData(data: [ProductData]) {
        self.data.removeAll()
        self.data = data
        
        self.reloadData()
    }
    
    var callback: (() -> ())?
}

extension ProductsCarousel: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        cell.data = self.data[indexPath.item]
        return cell
    }
}
