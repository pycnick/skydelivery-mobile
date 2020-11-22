//
//  MainViewController.swift
//  skydelivery-mobile
//
//  Created by pycnick on 20.11.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    // MARK: - Properties
    lazy var restaurantsLabel = Title(text: "Рестораны", font: UIFont(name: "Arial", size: 40)!)
    lazy var restaurantsCarousel = RestaurantsCarousel()
    
    lazy var recommendationsLabel = Title(text: "Рекоммендации", font: UIFont(name: "Arial", size: 40)!)
    lazy var recomendationsCarousel = RestaurantsCarousel()
    
    lazy var categoryLabel = Title(text: "Категории", font: UIFont(name: "Arial", size: 40)!)
    lazy var categoryCarousel = RestaurantsCarousel()
}

extension MainViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        
        self.view.addSubview(restaurantsLabel)
        restaurantsLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        restaurantsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        restaurantsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true

        self.view.addSubview(restaurantsCarousel)
        restaurantsCarousel.backgroundColor = .white
        restaurantsCarousel.translatesAutoresizingMaskIntoConstraints = false
        restaurantsCarousel.topAnchor.constraint(equalTo: restaurantsLabel.bottomAnchor, constant: 20).isActive = true
        restaurantsCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        restaurantsCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        restaurantsCarousel.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.view.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: restaurantsCarousel.bottomAnchor, constant: 20).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(categoryCarousel)
        categoryCarousel.backgroundColor = .white
        categoryCarousel.translatesAutoresizingMaskIntoConstraints = false
        categoryCarousel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20).isActive = true
        categoryCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        categoryCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        categoryCarousel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.view.addSubview(recommendationsLabel)
        recommendationsLabel.translatesAutoresizingMaskIntoConstraints = false
        recommendationsLabel.topAnchor.constraint(equalTo: categoryCarousel.bottomAnchor, constant: 20).isActive = true
        recommendationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        recommendationsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true

        self.view.addSubview(recomendationsCarousel)
        recomendationsCarousel.backgroundColor = .white
        recomendationsCarousel.translatesAutoresizingMaskIntoConstraints = false
        recomendationsCarousel.topAnchor.constraint(equalTo: recommendationsLabel.bottomAnchor, constant: 40).isActive = true
        recomendationsCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        recomendationsCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        recomendationsCarousel.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
}
