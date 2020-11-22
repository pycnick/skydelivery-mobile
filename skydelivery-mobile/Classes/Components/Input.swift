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
    
    init(text: String, placeholder: String, font: UIFont) {
        super.init(frame: CGRect())
        self.placeholder = placeholder
        self.text = text
        self.font = font
    }
}
