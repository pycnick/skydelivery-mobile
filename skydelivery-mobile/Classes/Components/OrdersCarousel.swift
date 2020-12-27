//
//  OrdersCarousel.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import UIKit

class HistorysCarousel: UICollectionView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
                
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(HistoryCell.self, forCellWithReuseIdentifier: "cell")
        
        self.delegate = self
        self.dataSource = self
    }
    
    var data = [
        HistoryData(ID: 0, RestID: 0, Address: "Знаменская 53", Products: [Product](), Price: 1200, Created: "alskf", Status: "Done"),
        HistoryData(ID: 0, RestID: 0, Address: "Знаменская 53", Products: [Product](), Price: 1200, Created: "alskf", Status: "Accepted"),
        HistoryData(ID: 0, RestID: 0, Address: "Знаменская 53", Products: [Product](), Price: 1200, Created: "alskf", Status: "Done"),
        HistoryData(ID: 0, RestID: 0, Address: "Знаменская 53", Products: [Product](), Price: 1200, Created: "alskf", Status: "Delivering"),
        HistoryData(ID: 0, RestID: 0, Address: "Знаменская 53", Products: [Product](), Price: 1200, Created: "alskf", Status: "Delivering"),
    ]
    
    func SetData(data: [HistoryData]) {
        self.data.removeAll()
        self.data = data
        
        self.reloadData()
    }
    
    var callback: (() -> ())?
}

extension HistorysCarousel: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HistoryCell
        cell.data = self.data[indexPath.item]
        return cell
    }
}
