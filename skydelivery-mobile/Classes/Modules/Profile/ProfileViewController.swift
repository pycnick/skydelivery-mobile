//
//  ProfileViewController.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    var presenter: ViewToPresenterProfileProtocol?
    
    lazy var profileTitle = Title(text: "Профиль 🐻‍❄️", font: UIFont(name: "Arial", size: 40)!)
    lazy var nameTitle = Title(text: "Имя", font: UIFont(name: "Arial", size: 20)!)
    lazy var surnameTitle = Title(text: "Фамилия", font: UIFont(name: "Arial", size: 20)!)
    lazy var emailTitle = Title(text: "Электронная почта", font: UIFont(name: "Arial", size:20)!)
    lazy var phoneTitle = Title(text: "Телефон", font: UIFont(name: "Arial", size: 20)!)
    
    lazy var nameInput =  Input(text: "", placeholder: "Имя", fontSize: CGFloat(15));

    lazy var surnameInput =  Input(text: "", placeholder: "Фамилия", fontSize: CGFloat(15))
    lazy var emailInput =  Input(text: "", placeholder: "Электронная почта", fontSize: CGFloat(15))
    lazy var phoneInput =  Input(text: "", placeholder: "Номер телефона", fontSize: CGFloat(15))
    
    lazy var submitButton = Button(title: "Сохранить", font: UIFont(name: "Arial", size: 20)!)
    
    lazy var ordersButton = Button(title: "Мои заказы", font: UIFont(name: "Arial", size: 20)!)
}

extension ProfileViewController {
    
    @objc func setProfile(_ notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            self.nameInput.text = dict["firstName"] as! String
            self.surnameInput.text = dict["secondName"] as! String
            self.phoneInput.text = dict["phone"] as! String
            self.emailInput.text = dict["email"] as! String
        }
    }
    
    @IBAction func processEditBio() {
        presenter?.editProfile(req: ProfileRequest(firstname: nameInput.text ?? "", lastname: surnameInput.text ?? "", email: emailInput.text ?? ""))
    }
    
    @IBAction func showHistory() {
        let view = HistoryRouter.createView()
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func setupUI(){
        overrideUserInterfaceStyle = .light
        
        view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.setProfile(_:)), name: NSNotification.Name(rawValue: "setProfile"), object: nil)
                
        
        self.view.addSubview(profileTitle)
        profileTitle.translatesAutoresizingMaskIntoConstraints = false
        profileTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        profileTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        profileTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(nameTitle)
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.topAnchor.constraint(equalTo: profileTitle.bottomAnchor, constant: 60).isActive = true
        nameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        nameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(nameInput)
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        nameInput.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 10).isActive = true
        nameInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        nameInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        
        self.view.addSubview(surnameTitle)
        surnameTitle.translatesAutoresizingMaskIntoConstraints = false
        surnameTitle.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 30).isActive = true
        surnameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        surnameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(surnameInput)
        surnameInput.translatesAutoresizingMaskIntoConstraints = false
        surnameInput.topAnchor.constraint(equalTo: surnameTitle.bottomAnchor, constant: 10).isActive = true
        surnameInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        surnameInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(emailTitle)
        emailTitle.translatesAutoresizingMaskIntoConstraints = false
        emailTitle.topAnchor.constraint(equalTo: surnameInput.bottomAnchor, constant: 30).isActive = true
        emailTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(emailInput)
        emailInput.translatesAutoresizingMaskIntoConstraints = false
        emailInput.topAnchor.constraint(equalTo: emailTitle.bottomAnchor, constant: 10).isActive = true
        emailInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(phoneTitle)
        phoneTitle.translatesAutoresizingMaskIntoConstraints = false
        phoneTitle.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: 30).isActive = true
        phoneTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        phoneTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        self.view.addSubview(phoneInput)
        phoneInput.translatesAutoresizingMaskIntoConstraints = false
        phoneInput.topAnchor.constraint(equalTo: phoneTitle.bottomAnchor, constant: 10).isActive = true
        phoneInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        phoneInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        
        self.view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -140).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: self.submitButton.topAnchor, constant: 40).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        submitButton.addTarget(self, action: #selector(self.processEditBio), for: .touchUpInside)
        
        self.view.addSubview(ordersButton)
        ordersButton.translatesAutoresizingMaskIntoConstraints = false
        ordersButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20).isActive = true
        ordersButton.bottomAnchor.constraint(equalTo: ordersButton.topAnchor, constant: 40).isActive = true
        ordersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        ordersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        ordersButton.addTarget(self, action: #selector(self.showHistory), for: .touchUpInside)
    }
}

extension ProfileViewController: PresenterToViewProfileProtocol {
    func SetProfile(profile: ProfileData) {
        self.nameInput.text = profile.firstName
        self.surnameInput.text = profile.surName
        self.phoneInput.text = profile.phone
        self.emailInput.text = profile.email
    }
    
    func ShowLogin() {
        view.addSubview(LogInRouter.createView())
    }
}
