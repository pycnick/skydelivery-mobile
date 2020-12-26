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
    }
    
    lazy var categoryLabel = Title(text: "Рестораны", font: UIFont(name: "Arial", size: 40)!)
    lazy var categoryCarousel = CategoryCarousel()
}

extension CategoryViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        
        view.backgroundColor = .white
        
        self.view.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true

        self.view.addSubview(categoryCarousel)
        categoryCarousel.backgroundColor = .white
        categoryCarousel.translatesAutoresizingMaskIntoConstraints = false
        categoryCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        categoryCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        categoryCarousel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 40).isActive = true
        categoryCarousel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
}
