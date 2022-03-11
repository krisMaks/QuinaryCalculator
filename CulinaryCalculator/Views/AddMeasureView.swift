//
//  AddMeasureView.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 25.02.2022.
//

import UIKit

class AddMeasureView: UIView {
    
    let titleLabel = UILabel(text: "Добавить меру", font: FontsLibrary.measureIngredientLabelText)
    let titleTF = UITextField(placeholder: "Название меры")
    let koeffTF = UITextField(placeholder: "Сколько в нем кг?")
    let typeSegmentControl = UISegmentedControl()
    let saveButton = UIButton(title: "Сохранить", bgColor: .systemGreen, textColor: .white)
    
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .systemPink
        setViews()
        setConstraints()
    }
    
    func setViews() {
        titleLabel.backgroundColor = .clear
        titleLabel.textAlignment = .center
        titleLabel.textColor = .darkGray
        
        typeSegmentControl.insertSegment(withTitle: "Вес", at: 0, animated: false)
        typeSegmentControl.insertSegment(withTitle: "Объем", at: 1, animated: false)
        typeSegmentControl.selectedSegmentIndex = 0
        koeffTF.keyboardType = .decimalPad
    }
    
    func setConstraints() {
        let stack = UIStackView(views: [titleLabel, titleTF, koeffTF, typeSegmentControl, saveButton], axis: .vertical, spacing: 20)
        
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
