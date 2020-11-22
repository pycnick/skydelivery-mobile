//
//  CategoryCarousel.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import UIKit

class CategoryCarousel: UICollectionView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
    
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsVerticalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(CategoryCell.self, forCellWithReuseIdentifier: "cell")
        
        self.delegate = self
        self.dataSource = self
        
    }
    
    var data = [
        CategoryData(title: "The Islands!", info: "★4.1", url: "maxcodes.io/enroll", backgroundImage: #imageLiteral(resourceName: "obedy-v-ofis-vkusnaya-i-polnocennaya-eda-vo-vremya-obedennogo-pereryva")),
        CategoryData(title: "Subscribe to", info: "★ 4.3", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "food")),
        CategoryData(title: "StoreKit Course!", info: "★ 4.8", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "270718")),
        CategoryData(title: "Collection Views!", info: "★ 4.4", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "obedy-v-ofis-vkusnaya-i-polnocennaya-eda-vo-vremya-obedennogo-pereryva")),
        CategoryData(title: "MapKit!", info: "★ 4.3", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "food"))
    ]
}

extension CategoryCarousel: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCell
        cell.data = self.data[indexPath.item]
        return cell
    }
    
}
