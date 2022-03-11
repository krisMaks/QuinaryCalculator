//
//  Label.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 24.02.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String,
                     font: UIFont) {
        self.init(frame: CGRect())
        self.text = text
        self.font = font
        self.textColor = .white
        self.layer.cornerRadius = 16
        self.backgroundColor = UIColor(named: "blackAlpha")
    }
}
