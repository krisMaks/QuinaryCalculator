//
//  DeleteButtonInCell.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 10.03.2022.
//

import UIKit

class DeleteButtonInCell: UIButton {

    var indexPath: IndexPath = [0, 0]
    
    init() {
        super.init(frame: CGRect())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
