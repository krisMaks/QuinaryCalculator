//
//  StackView.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 24.02.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(views: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
    }
}
