//
//  RecipesCell.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 02.03.2022.
//

import UIKit

class RecipesCell: UICollectionViewCell {
    static let reuseID = "RecipesCell"
    let imageView = UIImageView(image: UIImage(named: "borsh"))
    let titleLabel = UILabel(text: "Борщ свекольный", font: FontsLibrary.recipeCellText)
    let deleteButton = DeleteButtonInCell()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    func setViews() {
        imageView.backgroundColor = .green
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        titleLabel.numberOfLines = 4
        deleteButton.setBackgroundImage(UIImage(systemName: "trash.circle"), for: .normal)
        deleteButton.tintColor = .red
        deleteButton.backgroundColor = ColorsLibrary.blackAlpha
        deleteButton.layer.cornerRadius = 20
    }
    
    func setConstraints() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(deleteButton)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            deleteButton.widthAnchor.constraint(equalToConstant: 40),
            deleteButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 60)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
