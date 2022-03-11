//
//  AddIngredientView.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 25.02.2022.
//

import UIKit

class AddIngredientView: UIView {
    
    let titleLabel = UILabel(text: "Добавить ингредиент", font: FontsLibrary.measureIngredientLabelText)
    let titleTF = UITextField(placeholder: "Название ингредиента")
    let densityTF = UITextField(placeholder: "Плотность ингредиента")
    let saveButton = UIButton(title: "Сохранить", bgColor: ColorsLibrary.green, textColor: .white)
    let emptyView = UIView()
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .systemBlue
        setViews()
        setConstraints()
    }
    
    func setViews() {
        titleLabel.backgroundColor = .clear
        titleLabel.textAlignment = .center
        titleLabel.textColor = .darkGray
        densityTF.keyboardType = .decimalPad
    }
    
    func setConstraints() {
        let stack = UIStackView(views: [titleLabel, titleTF, densityTF, emptyView, saveButton], axis: .vertical, spacing: 20)
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100)
        ])
        
        for view in stack.arrangedSubviews {
            view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
