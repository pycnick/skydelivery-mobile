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
        RestaurantData(title: "Макдоналдс", url: "maxcodes.io/enroll", backgroundImage: #imageLiteral(resourceName: "HE5JX8qMsJJvvZArdrzZXN")),
        RestaurantData(title: "Пиццерия", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "b_img5de908746e39d3.43406923")),
        RestaurantData(title: "Бургерная", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "270718")),
        RestaurantData(title: "Салатная", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "food")),
        RestaurantData(title: "Сковородочная", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "obedy-v-ofis-vkusnaya-i-polnocennaya-eda-vo-vremya-obedennogo-pereryva"))
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
        self.callback?(Restaurant(name: self.data[indexPath.item].title))
    }

}
