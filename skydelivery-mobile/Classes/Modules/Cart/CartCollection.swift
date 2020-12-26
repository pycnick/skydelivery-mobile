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
        CartProductData(title: "Product 1", price: 10, count: 1, backgroundImage: #imageLiteral(resourceName: "mcdonalds-Double-Big-Mac")),
        CartProductData(title: "Product 2", price: 20, count: 2, backgroundImage: #imageLiteral(resourceName: "mcdonalds-Cheese-Melt-Dippers")),
        CartProductData(title: "Product Big", price: 1000, count: 2, backgroundImage: #imageLiteral(resourceName: "mcdonalds-The-Jerk-Chicken-Sandwhich")),
    ]
        
    var culteryCount = 1
    
    weak var controller : CartControllerView? {
        didSet {
            controller?.refreshFullPrice()
        }
    }
    
    public func removeCell(_ cell: UICollectionViewCell) {
        let indexPath = self.indexPath(for: cell)!

        let alert = UIAlertController(
            title: "Удаление товара",
            message: "Вы действительно хотите удалить товар \'\(data[indexPath.row].title)\' из корзины?",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
            self.data.remove(at: indexPath.row)
            self.controller?.refreshFullPrice()
            
            self.performBatchUpdates({
                self.deleteItems(at: [indexPath])
            }, completion: { action in
                if self.data.isEmpty {
                    let emptyLabel = UILabel()
                    self.addSubview(emptyLabel)
                    emptyLabel.font = UIFont(name: "Arial", size: 20)
                    emptyLabel.numberOfLines = 3
                    emptyLabel.text = "Корзина пуста"
                    
                    emptyLabel.translatesAutoresizingMaskIntoConstraints = false
                    emptyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                    emptyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
                }
            })
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
