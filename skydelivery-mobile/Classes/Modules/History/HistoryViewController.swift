//
//  HistoryViewController.swift
//  skydelivery-mobile
//
//  Created by pycnick on 27.12.2020.
//

import UIKit

class HistoryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter?.viewDidLoad()
    }
    
    var presenter: ViewToPresenterHistoryProtocol?
    
    var orders = HistorysCarousel()
    
    lazy var name = Title(text: "История 🛵", font: UIFont.systemFont(ofSize: 30, weight: .light))
}

extension HistoryViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        self.view.addSubview(name)
        self.view.addSubview(orders)
        
        name.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        name.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        orders.backgroundColor = .white
        orders.translatesAutoresizingMaskIntoConstraints = false
        orders.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        orders.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        orders.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20).isActive = true
        orders.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        
//        ApiManager.shared.GetUserOrders(count: 7, page: 1) { (orders) in
//            print(orders?.List?[0].Created)
//        }
    }
}

extension HistoryViewController: PresenterToViewHistoryProtocol {
    func OnSuccessHistory(orders: [HistoryData]) {
        if orders.isEmpty {
            self.orders.removeFromSuperview()
            
            let emptyLabel = UILabel()
            self.view.addSubview(emptyLabel)
            emptyLabel.font = UIFont(name: "Arial", size: 20)
            emptyLabel.numberOfLines = 3
            emptyLabel.text = "История пуста"
            
            emptyLabel.translatesAutoresizingMaskIntoConstraints = false
            emptyLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            emptyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
            return
        }
        
        self.orders.SetData(data: orders)
    }
}
