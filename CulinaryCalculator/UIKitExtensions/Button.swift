//
//  Button.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 24.02.2022.
//

import UIKit

extension UIButton {
    convenience init(title: String,
                     bgColor: UIColor,
                     textColor: UIColor) {
        self.init(type: .system)
        setTitle(title, for: .normal)
        self.backgroundColor = bgColor
        self.tintColor = textColor
        self.titleLabel!.font = UIFont(name: "AvenirNext-Bold", size: 18)!
    }
}
