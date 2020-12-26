//
//  File.swift
//  skydelivery-mobile
//
//  Created by Филипп Исполатов on 22.11.2020.
//

import UIKit

class Button: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(title: String, font: UIFont) {
        super.init(frame: CGRect())
        self.setTitle(title, for: .normal)
        self.backgroundColor = .systemBlue
        self.layer.cornerRadius = 12
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
