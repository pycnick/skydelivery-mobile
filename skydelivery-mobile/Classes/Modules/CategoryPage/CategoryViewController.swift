//
//  CategoryViewController.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import UIKit

class CategoryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        presenter?.viewDidLoad(id: Id)
    }
    
    var Id: Int = 0
    
    var presenter: ViewToPresenterCategoryProtocol?
    
    func callback(restaurant: Restaurant)  {
        let view = RestaurantRouter.createRestaurantModule(restaurant: restaurant)
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    lazy var categoryLabel = Title(text: "Рестораны 🥑", font: UIFont.systemFont(ofSize: 40, weight: .light))
    lazy var categoryCarousel = CategoryCarousel(callback: callback)
}

extension CategoryViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        
        view.backgroundColor = .white
        
        self.view.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true

        self.view.addSubview(categoryCarousel)
        categoryCarousel.backgroundColor = .white
        categoryCarousel.translatesAutoresizingMaskIntoConstraints = false
        categoryCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        categoryCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        categoryCarousel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20).isActive = true
        categoryCarousel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}

extension CategoryViewController: PresenterToViewCategoryProtocol {
    func SetRestaurants(data: [RestaurantData]) {
        self.categoryCarousel.SetData(data: data)
    }
}
