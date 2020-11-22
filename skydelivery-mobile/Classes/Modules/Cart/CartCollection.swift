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
    
    var data = [
        CartProductData(title: "Product 1", price: 10.0, count: 1, backgroundImage: #imageLiteral(resourceName: "default")),
        CartProductData(title: "Product 2", price: 20.0, count: 2, backgroundImage: #imageLiteral(resourceName: "default")),
        CartProductData(title: "Product With Big Big Big Big Name", price: 1000.0, count: 2, backgroundImage: #imageLiteral(resourceName: "default")),
    ]
    
    weak var controller : UIViewController?
    
    public func removeCell(_ cell: UICollectionViewCell) {
        let indexPath = self.indexPath(for: cell)!

        let alert = UIAlertController(
            title: "Удаление товара",
            message: "Вы действительно хотите удалить товар \'\(data[indexPath.row].title)\' из корзины?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            self.data.remove(at: indexPath.row)
            self.performBatchUpdates({
                self.deleteItems(at: [indexPath])
            }, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        
        self.controller?.present(alert, animated: true)
    }
}

extension CartCollection: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CartCell
        cell.data = self.data[indexPath.item]
        cell.parentView = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/6)
    }
}
