//
//  Input.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import UIKit

class Input: UITextField {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let padding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

        override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    
    init(text: String, placeholder: String, fontSize: CGFloat) {
        super.init(frame: CGRect())
        self.placeholder = placeholder
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 16
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
