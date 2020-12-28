//
//  OrderViewController.swift
//  skydelivery-mobile
//
//  Created by a.postnikov on 28.12.2020.
//

import UIKit

class OrderViewController: UIViewController {
    init(FullPrice: Int) {
        super.init(nibName: nil, bundle: nil)
        self.fullPrice = FullPrice
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var presenter : ViewToPresenterOrderProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    var fullPrice: Int = 0
    
    var culteryCount: Int = 1 {
        didSet {
            culteryCountLabel.text = "\(culteryCount)"
        }
    }
    
    lazy var orderLabel = Title(text: "Заказ", font: UIFont(name: "Arial", size: 40)!)
    
    lazy var addressTitle = Title(text: "Адрес доставки", font: UIFont(name: "Arial", size: 25)!)
    lazy var phoneTitle = Title(text: "Телефон", font: UIFont(name: "Arial", size: 25)!)
    lazy var commentaryTitle = Title(text: "Комментарий", font: UIFont(name: "Arial", size: 25)!)
    lazy var culteryTitle = Title(text: "Количество персон", font: UIFont(name: "Arial", size: 25)!)
    
    lazy var addressInput = Input(text: "", placeholder: "Адрес", fontSize: CGFloat(20))
    lazy var phoneInput = Input(text: "", placeholder: "89001234567", fontSize: CGFloat(20))
    lazy var commentaryInput = Input(text: "", placeholder: "Комментарий", fontSize: CGFloat(20))
    
    lazy var culteryCountLabel = Title(text: "1", font: UIFont(name: "Arial", size: 25)!)
    lazy var add = UIButton()
    lazy var rmv = UIButton()

    lazy var submitButton = Button(title: "Оформить заказ", font: UIFont(name: "Arial", size: 20)!)
    
    @IBAction func addOne() {
        culteryCount += 1
    }
    
    @IBAction func removeOne() {
        if culteryCount > 0 {
            culteryCount -= 1
        }
    }
    
    @IBAction func submit() {
        presenter?.checkoutOrder(order: OrderRequest(
                address: addressInput.text ?? "",
                phone: phoneInput.text ?? "",
                comment: commentaryInput.text ?? "",
                persons: culteryCount,
                fullPrice: fullPrice
            )
        )
    }
}

extension OrderViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        
        self.view.addSubview(orderLabel)
        orderLabel.translatesAutoresizingMaskIntoConstraints = false
        orderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        orderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        orderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(addressTitle)
        addressTitle.translatesAutoresizingMaskIntoConstraints = false
        addressTitle.topAnchor.constraint(equalTo: orderLabel.bottomAnchor, constant: 20).isActive = true
        addressTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        self.view.addSubview(addressInput)
        addressInput.translatesAutoresizingMaskIntoConstraints = false
        addressInput.topAnchor.constraint(equalTo: addressTitle.bottomAnchor, constant: 10).isActive = true
        addressInput.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        self.view.addSubview(phoneTitle)
        phoneTitle.translatesAutoresizingMaskIntoConstraints = false
        phoneTitle.topAnchor.constraint(equalTo: addressInput.bottomAnchor, constant: 20).isActive = true
        phoneTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        self.view.addSubview(phoneInput)
        phoneInput.translatesAutoresizingMaskIntoConstraints = false
        phoneInput.topAnchor.constraint(equalTo: phoneTitle.bottomAnchor, constant: 10).isActive = true
        phoneInput.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        self.view.addSubview(commentaryTitle)
        commentaryTitle.translatesAutoresizingMaskIntoConstraints = false
        commentaryTitle.topAnchor.constraint(equalTo: phoneInput.bottomAnchor, constant: 20).isActive = true
        commentaryTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        self.view.addSubview(commentaryInput)
        commentaryInput.translatesAutoresizingMaskIntoConstraints = false
        commentaryInput.topAnchor.constraint(equalTo: commentaryTitle.bottomAnchor, constant: 10).isActive = true
        commentaryInput.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        self.view.addSubview(culteryTitle)
        culteryTitle.translatesAutoresizingMaskIntoConstraints = false
        culteryTitle.topAnchor.constraint(equalTo: commentaryInput.bottomAnchor, constant: 20).isActive = true
        culteryTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        self.view.addSubview(rmv)
        rmv.setTitle("-", for: .normal)
        rmv.backgroundColor = .blue
        rmv.layer.cornerRadius = 8
        rmv.translatesAutoresizingMaskIntoConstraints = false
        rmv.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        rmv.topAnchor.constraint(equalTo: culteryTitle.bottomAnchor, constant: 20).isActive = true
        rmv.addTarget(self, action: #selector(removeOne), for: .touchUpInside)
        
        self.view.addSubview(culteryCountLabel)
        culteryCountLabel.translatesAutoresizingMaskIntoConstraints = false
        culteryCountLabel.leftAnchor.constraint(equalTo: rmv.rightAnchor, constant: 20).isActive = true
        culteryCountLabel.topAnchor.constraint(equalTo: culteryTitle.bottomAnchor, constant: 25).isActive = true
        culteryCountLabel.font = UIFont(name: "Arial", size: 20)
        
        self.view.addSubview(add)
        add.setTitle("+", for: .normal)
        add.backgroundColor = .blue
        add.layer.cornerRadius = 8
        add.translatesAutoresizingMaskIntoConstraints = false
        add.leftAnchor.constraint(equalTo: culteryCountLabel.rightAnchor, constant: 20).isActive = true
        add.topAnchor.constraint(equalTo: culteryTitle.bottomAnchor, constant: 20).isActive = true
        add.addTarget(self, action: #selector(addOne), for: .touchUpInside)
        
        self.view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }
}

extension OrderViewController: PresenterToViewOrderProtocol {
    func makeAlert(text: String) {
        let alert = UIAlertController(
            title: "Ошибка оформления заказа",
            message: text,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
                                        
        self.present(alert, animated: true, completion: nil)
    }
    
    func closeView() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
