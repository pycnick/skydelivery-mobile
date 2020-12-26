//
//  Title.swift
//  skydelivery-mobile
//
//  Created by pycnick on 21.11.2020.
//

import UIKit

class Title: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(text: String, font: UIFont) {
        super.init(frame: CGRect())
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = font
    }
}
