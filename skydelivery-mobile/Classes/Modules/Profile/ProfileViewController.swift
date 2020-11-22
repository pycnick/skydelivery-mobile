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
    }
    
    lazy var profileTitle = Title(text: "Профиль", font: UIFont(name: "Arial", size: 40)!)
    lazy var nameTitle = Title(text: "Имя", font: UIFont(name: "Arial", size: 20)!)
    lazy var surnameTitle = Title(text: "Фамилия", font: UIFont(name: "Arial", size: 20)!)
    lazy var emailTitle = Title(text: "Электронная почта", font: UIFont(name: "Arial", size:20)!)
    lazy var phoneTitle = Title(text: "Телефон", font: UIFont(name: "Arial", size: 20)!)
    
    lazy var nameInput =  Input(text: "Филипп", placeholder: "Имя", font: UIFont(name: "Arial", size: 15)!)
    lazy var surnameInput =  Input(text: "", placeholder: "Фамилия", font: UIFont(name: "Arial", size: 15)!)
    lazy var emailInput =  Input(text: "philipp-is@yandex.ru", placeholder: "Электронная почта", font: UIFont(name: "Arial", size: 15)!)
    lazy var phoneInput =  Input(text: "89009261549", placeholder: "Номер телефона", font: UIFont(name: "Arial", size: 15)!)
    
    lazy var submitButton = Button(title: "Сохранить", font: UIFont(name: "Arial", size: 20)!)
}

extension ProfileViewController {
    func setupUI(){
        overrideUserInterfaceStyle = .light
        
        self.view.addSubview(profileTitle)
        profileTitle.translatesAutoresizingMaskIntoConstraints = false
        profileTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
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
        submitButton.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -90).isActive = true
        submitButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
}
