//
//  SignupView.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 25.12.2020.
//

import UIKit

class SignupView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        setupUI()
        
        animateIn()
    }
    
    @objc fileprivate func animateOut() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc fileprivate func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var firstNameTitle = Title(text: "Имя", font: UIFont(name: "Arial", size: 25)!)
    lazy var surNameTitle = Title(text: "Фамилия", font: UIFont(name: "Arial", size: 25)!)
    lazy var phoneTitle = Title(text: "Телефон", font: UIFont(name: "Arial", size: 25)!)
    lazy var pswd1Title = Title(text: "Пароль", font: UIFont(name: "Arial", size: 25)!)
    lazy var pswd2Title = Title(text: "Пароль", font: UIFont(name: "Arial", size: 25)!)
    
    lazy var firstNameInput =  Input(text: "", placeholder: "Иван", fontSize: CGFloat(20));
    lazy var surNameInput =  Input(text: "", placeholder: "Иванов", fontSize: CGFloat(20));
    lazy var phoneInput =  Input(text: "", placeholder: "89001234567", fontSize: CGFloat(20));
    lazy var pswd1Input =  Input(text: "", placeholder: "Пароль", fontSize: CGFloat(20));
    lazy var pswd2Input =  Input(text: "", placeholder: "Пароль", fontSize: CGFloat(20));
    
    lazy var submitButton = Button(title: "Зарегестрироваться", font: UIFont(name: "Arial", size: 20)!)
    
//    fileprivate lazy var stack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [firstNameTitle, firstNameInput, surNameTitle, surNameInput, phoneTitle, phoneInput, pswd1Title, pswd1Input, pswd2Title, pswd2Input, submitButton])
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .vertical
//        stack.spacing = 10
//        return stack
//    }()
    
    fileprivate lazy var container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        v.layer.cornerRadius = 24
        
        return v
    }()
}

extension SignupView {
    func setupUI(){
        overrideUserInterfaceStyle = .light
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
        self.backgroundColor = .clear

        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //always fill the view
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        
        self.frame = UIScreen.main.bounds
        
        container.addSubview(firstNameTitle)
        container.addSubview(firstNameInput)
        container.addSubview(surNameTitle)
        container.addSubview(surNameInput)
        container.addSubview(phoneTitle)
        container.addSubview(phoneInput)
        container.addSubview(pswd1Title)
        container.addSubview(pswd1Input)
        container.addSubview(pswd2Title)
        container.addSubview(pswd2Input)
        container.addSubview(submitButton)
        
        self.addSubview(container)
        
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        

        
//        stack.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
//        stack.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
//        stack.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
//        stack.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5).isActive = true
        
        
        phoneTitle.textColor = .white
        pswd1Title.textColor = .white
        pswd2Title.textColor = .white
        firstNameTitle.textColor = .white
        surNameTitle.textColor = .white
        
        phoneInput.textColor = .white
        pswd1Input.textColor = .white
        pswd2Input.textColor = .white
        firstNameInput.textColor = .white
        surNameInput.textColor = .white
        
        phoneTitle.textAlignment = .center
        pswd1Title.textAlignment = .center
        phoneInput.textAlignment = .center
        pswd1Input.textAlignment = .center
        pswd2Title.textAlignment = .center
        pswd2Input.textAlignment = .center
        firstNameTitle.textAlignment = .center
        firstNameInput.textAlignment = .center
        surNameTitle.textAlignment = .center
        surNameInput.textAlignment = .center
        

        
        firstNameTitle.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        firstNameTitle.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        firstNameTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 60).isActive = true
        
        firstNameInput.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        firstNameInput.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        firstNameInput.topAnchor.constraint(equalTo: firstNameTitle.bottomAnchor, constant: 10).isActive = true
        
        surNameTitle.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        surNameTitle.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        surNameTitle.topAnchor.constraint(equalTo: firstNameInput.bottomAnchor, constant: 20).isActive = true
        
        surNameInput.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        surNameInput.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        surNameInput.topAnchor.constraint(equalTo: surNameTitle.bottomAnchor, constant: 10).isActive = true
        
        phoneTitle.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        phoneTitle.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        phoneTitle.topAnchor.constraint(equalTo: surNameInput.bottomAnchor, constant: 20).isActive = true
       
        phoneInput.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        phoneInput.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        phoneInput.topAnchor.constraint(equalTo: phoneTitle.bottomAnchor, constant: 10).isActive = true
        
        pswd1Title.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        pswd1Title.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        pswd1Title.topAnchor.constraint(equalTo: phoneInput.bottomAnchor, constant: 20).isActive = true
        
        pswd1Input.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        pswd1Input.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        pswd1Input.topAnchor.constraint(equalTo: pswd1Title.bottomAnchor, constant: 10).isActive = true
        
        pswd2Title.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        pswd2Title.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        pswd2Title.topAnchor.constraint(equalTo: pswd1Input.bottomAnchor, constant: 20).isActive = true
        
        pswd2Input.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        pswd2Input.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        pswd2Input.topAnchor.constraint(equalTo: pswd2Title.bottomAnchor, constant: 10).isActive = true
        
        submitButton.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        submitButton.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        submitButton.topAnchor.constraint(equalTo: pswd2Input.bottomAnchor, constant: 40).isActive = true
    }
}

