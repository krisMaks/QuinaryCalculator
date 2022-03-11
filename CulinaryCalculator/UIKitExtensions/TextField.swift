//
//  TextField.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 24.02.2022.
//

import UIKit

extension UITextField {
    
    convenience init(placeholder: String) {
        self.init(frame: CGRect())
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.font = UIFont(name: "AvenirNext", size: 16)
        
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        self.leftViewMode = .always
    }
}
