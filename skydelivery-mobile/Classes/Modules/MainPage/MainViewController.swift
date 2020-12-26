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
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func openRestaurantPage(restaurant: Restaurant) {
        print("change location")
        self.navigationController?.pushViewController(RestaurantsViewController(restaurant: restaurant), animated: true)
    }
    
    func openCategoryRestaurant() {
        print("change location")
        self.navigationController?.pushViewController(CategoryViewController(), animated: true)
    }
    
    @IBAction func openProfile() {
        print("change location")
//        self.navigationController?.pushViewController(LoginViewController(), animated: true)
        let login = SignupView()
        self.view.addSubview(login)
    }
    
    @IBAction func openBasket() {
        self.navigationController?.pushViewController(CartControllerView(), animated: true)
    }
    
    // MARK: - Properties
    
    var presenter: ViewToPresenterMainProtocol?
    lazy var restaurantsLabel = Title(text: "Рестораны", font: UIFont(name: "Arial", size: 40)!)
    lazy var restaurantsCarousel = RestaurantsCarousel(callback: openRestaurantPage)
    
    lazy var recommendationsLabel = Title(text: "Рекоммендации", font: UIFont(name: "Arial", size: 40)!)
    lazy var recomendationsCarousel = RestaurantsCarousel(callback: openRestaurantPage)
    
    lazy var categoryLabel = Title(text: "Категории", font: UIFont(name: "Arial", size: 40)!)
    lazy var categoryCarousel = TagCarousel(callback: openCategoryRestaurant)
    
    var apiManager = ApiManager.shared
}

extension MainViewController {
    func setupUI() {
        HTTPCookieStorage.shared.cookies?.forEach(HTTPCookieStorage.shared.deleteCookie)
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
        restaurantsCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        restaurantsCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        restaurantsCarousel.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        
        self.view.addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: restaurantsCarousel.bottomAnchor, constant: 40).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(categoryCarousel)
        categoryCarousel.backgroundColor = .white
        categoryCarousel.translatesAutoresizingMaskIntoConstraints = false
        categoryCarousel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20).isActive = true
        categoryCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        categoryCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        categoryCarousel.heightAnchor.constraint(equalToConstant: view.frame.width/8).isActive = true
        
        self.view.addSubview(recommendationsLabel)
        recommendationsLabel.translatesAutoresizingMaskIntoConstraints = false
        recommendationsLabel.topAnchor.constraint(equalTo: categoryCarousel.bottomAnchor, constant: 40).isActive = true
        recommendationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        recommendationsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true

        self.view.addSubview(recomendationsCarousel)
        recomendationsCarousel.backgroundColor = .white
        recomendationsCarousel.translatesAutoresizingMaskIntoConstraints = false
        recomendationsCarousel.topAnchor.constraint(equalTo: recommendationsLabel.bottomAnchor, constant: 20).isActive = true
        recomendationsCarousel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        recomendationsCarousel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        recomendationsCarousel.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
        
        if self.apiManager.IsAuthenticated() {
            let button = UIButton(frame: CGRect(x: 350, y: 60, width: 50, height: 50))
            self.view.addSubview(button)
            button.setImage(#imageLiteral(resourceName: "icons8-male_user"), for: .normal)
            button.addTarget(self, action: #selector(self.openProfile), for: .touchUpInside)
            
            let button1 = UIButton(frame: CGRect(x: 280, y: 60, width: 50, height: 50))
            self.view.addSubview(button1)
            button1.setImage(#imageLiteral(resourceName: "icons8-basketball_net"), for: .normal)
            button1.addTarget(self, action: #selector(self.openBasket), for: .touchUpInside)
        } else {
            let button = UIButton(frame: CGRect(x: 350, y: 60, width: 50, height: 50))
            self.view.addSubview(button)
            button.setImage(#imageLiteral(resourceName: "icons8-male_user"), for: .normal)
            button.addTarget(self, action: #selector(self.openProfile), for: .touchUpInside)
        }
    }
}

extension MainViewController: PresenterToViewMainProtocol {
    func SetRestaurants(restaurants: [RestaurantData]) {
        self.restaurantsCarousel.SetData(data: restaurants)
    }
}
