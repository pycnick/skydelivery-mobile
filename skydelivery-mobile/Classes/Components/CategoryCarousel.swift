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

    init(callback: ((_ restaurant: Restaurant) -> ())?) {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .vertical


        super.init(frame: .zero, collectionViewLayout: layout)

        self.showsVerticalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(RestaurantCell.self, forCellWithReuseIdentifier: "cell")

        self.delegate = self
        self.dataSource = self

        self.callback = callback
    }
    
    var callback: ((_ restaurant: Restaurant) -> ())?

    var data = [
        RestaurantData(name: "Макдоналдс", id: 0, description: "", rating: 5.0, backgroundImage: #imageLiteral(resourceName: "HE5JX8qMsJJvvZArdrzZXN")),
    ]
    
    func SetData(data: [RestaurantData]) {
        self.data.removeAll()
        self.data = data
        
        self.reloadData()
    }
}

extension CategoryCarousel: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RestaurantCell
        cell.data = self.data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = self.data[indexPath.item]
        self.callback?(Restaurant(name: data.name, id: data.id))
    }

}
