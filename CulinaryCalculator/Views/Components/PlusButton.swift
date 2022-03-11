//
//  PlusButton.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 03.03.2022.
//

import UIKit

class PlusButton: UIButton {

    var indexPath: IndexPath = [0,0]

    init() {
        super.init(frame: CGRect())
        
        self.layer.shadowColor = UIColor.orange.cgColor
        self.layer.shadowRadius = 9
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.5
        
        self.layer.cornerRadius = 32
        self.setImage(UIImage(systemName: "plus"), for: .normal)
        self.backgroundColor = .systemOrange
        self.tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
