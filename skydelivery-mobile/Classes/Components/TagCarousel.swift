//
//  Carousel.swift
//  skydelivery-mobile
//
//  Created by pycnick on 21.11.2020.
//

import UIKit

class TagCarousel: UICollectionView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(callback: (() -> ())?) {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(TagCell.self, forCellWithReuseIdentifier: "cell")
        
        self.delegate = self
        self.dataSource = self
        
        self.callback = callback
    }
    
    func SetData(data: [TagData]) {
        self.data.removeAll()
        self.data = data
        
        self.reloadData()
    }
    
    var data = [
        TagData(id: 0, title: "Суши"),
        TagData(id: 0, title: "Пицца"),
        TagData(id: 0, title: "Бургеры"),
    ]
    
    var callback: (() -> ())?
}

extension TagCarousel: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TagCell
        cell.data = self.data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.callback?()
    }
    
}
