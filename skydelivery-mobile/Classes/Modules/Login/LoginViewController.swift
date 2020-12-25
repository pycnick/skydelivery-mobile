//
//  LoginViewController.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 25.12.2020.
//

import UIKit

class LoginView: UIView {
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
    
    
    lazy var phoneTitle = Title(text: "Телефон", font: UIFont(name: "Arial", size: 25)!)
    lazy var pswdTitle = Title(text: "Пароль", font: UIFont(name: "Arial", size: 25)!)
    
    lazy var phoneInput =  Input(text: "", placeholder: "Номер", fontSize: CGFloat(20));
    lazy var pswdInput =  Input(text: "", placeholder: "Пароль", fontSize: CGFloat(20));
    
    lazy var submitButton = Button(title: "Войти", font: UIFont(name: "Arial", size: 20)!)
    
//    fileprivate lazy var stack: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [phoneTitle, phoneInput, pswdTitle, pswdInput, submitButton])
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .vertical
//        stack.spacing = 20
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

extension LoginView {
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
        
        self.addSubview(container)
        
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        
        container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        
        container.addSubview(phoneTitle)
        container.addSubview(phoneInput)
        container.addSubview(pswdTitle)
        container.addSubview(pswdInput)
        container.addSubview(submitButton)
        
//        stack.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
//        stack.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
//        stack.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
//        stack.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5).isActive = true
        
        phoneTitle.textAlignment = .center
        pswdTitle.textAlignment = .center
        phoneInput.textAlignment = .center
        pswdInput.textAlignment = .center
        
        phoneTitle.textColor = .white
        pswdTitle.textColor = .white
        
        phoneInput.textColor = .white
        pswdInput.textColor = .white
        
        
        phoneTitle.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        phoneTitle.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        phoneTitle.topAnchor.constraint(equalTo: container.topAnchor, constant: 40).isActive = true
       
        phoneInput.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        phoneInput.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        phoneInput.topAnchor.constraint(equalTo: phoneTitle.bottomAnchor, constant: 10).isActive = true
        
        pswdTitle.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        pswdTitle.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        pswdTitle.topAnchor.constraint(equalTo: phoneInput.bottomAnchor, constant: 20).isActive = true
        
        pswdInput.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        pswdInput.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        pswdInput.topAnchor.constraint(equalTo: pswdTitle.bottomAnchor, constant: 10).isActive = true
        
        submitButton.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20).isActive = true
        submitButton.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 20).isActive = true
        submitButton.topAnchor.constraint(equalTo: pswdInput.bottomAnchor, constant: 40).isActive = true
    }
}

