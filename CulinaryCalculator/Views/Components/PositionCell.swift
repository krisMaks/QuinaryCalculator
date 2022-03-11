//
//  PositionCell.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 25.02.2022.
//

import UIKit

class PositionCell: UITableViewCell {
    
    static let reuseID = "PositionCell"
    
    let titleLabel = UILabel(text: "Соль поваренная", font: FontsLibrary.positionCellText)
    let countLabel = UILabel(text: "15 гр", font: FontsLibrary.positionCellText)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack = UIStackView(views: [titleLabel, countLabel],
                                axis: .horizontal,
                                spacing: 20)
        
        for view in stack.arrangedSubviews {
            view.backgroundColor = .clear
        }
        backgroundColor = .clear
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            countLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
