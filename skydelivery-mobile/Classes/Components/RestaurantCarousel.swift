//
//  Carousel.swift
//  skydelivery-mobile
//
//  Created by pycnick on 21.11.2020.
//

import UIKit

class RestaurantsCarousel: UICollectionView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(RestaurantCell.self, forCellWithReuseIdentifier: "cell")
        
        self.delegate = self
        self.dataSource = self
    }
    
    var data = [
        RestaurantData(title: "The Islands!", url: "maxcodes.io/enroll", backgroundImage: #imageLiteral(resourceName: "HE5JX8qMsJJvvZArdrzZXN")),
        RestaurantData(title: "Subscribe to maxcodes boiiii!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "HE5JX8qMsJJvvZArdrzZXN")),
        RestaurantData(title: "StoreKit Course!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "HE5JX8qMsJJvvZArdrzZXN")),
        RestaurantData(title: "Collection Views!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "HE5JX8qMsJJvvZArdrzZXN")),
        RestaurantData(title: "MapKit!", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "HE5JX8qMsJJvvZArdrzZXN"))
    ]
}

extension RestaurantsCarousel: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RestaurantCell
        cell.data = self.data[indexPath.item]
        return cell
    }
    
}
