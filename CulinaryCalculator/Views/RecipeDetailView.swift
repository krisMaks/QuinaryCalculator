//
//  RecipeDetailView.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 03.03.2022.
//

import UIKit

class RecipeDetailView: UIView {

    let imageView = UIImageView(image: UIImage(named: "Цезарь"))
    let titleLabel = UILabel(text: "Цезарь с курицей", font: FontsLibrary.titleLabel)
    let ingredientsTitleLabel = UILabel(text: "Ингредиенты:", font: FontsLibrary.recipeCellText)
    let ingredientsLabel = UILabel(text: "Ингредиенты", font: FontsLibrary.positionCellText)
    let categoryLabel = UILabel(text: "Второе", font: FontsLibrary.titleMiniLabel)
    let descriptionTextView = UITextView()
    
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    func setViews() {
        imageView.backgroundColor = .white
        titleLabel.backgroundColor = .clear
        categoryLabel.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowRadius = 1
        titleLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        titleLabel.layer.shadowOpacity = 1
        
        categoryLabel.layer.shadowColor = UIColor.black.cgColor
        categoryLabel.layer.shadowRadius = 3
        categoryLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        categoryLabel.layer.shadowOpacity = 1
        
        ingredientsLabel.backgroundColor = .clear
        ingredientsLabel.textColor = .black
        
        ingredientsTitleLabel.backgroundColor = .clear
        ingredientsTitleLabel.textColor = .black
        
        ingredientsLabel.numberOfLines = 4
        descriptionTextView.isEditable = false
        
    }
    
    func setConstraints() {
        imageView.addSubview(titleLabel)
        imageView.addSubview(categoryLabel)
        let stack = UIStackView(views: [ingredientsTitleLabel, ingredientsLabel, descriptionTextView], axis: .vertical, spacing: 16)
        stack.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        addSubview(stack)
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 260)
        ])
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
