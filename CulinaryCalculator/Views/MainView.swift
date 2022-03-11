//
//  MainView.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 24.02.2022.
//

import UIKit

class MainView: UIView {
    
    let bgImageView = UIImageView(image: UIImage(named: "bg"))
    let initCountTF = UITextField(placeholder: "Количество")
    let initMeasureTF = UITextField(placeholder: "Из...")
    let resultMeasureTF = UITextField(placeholder: "В...")
    let ingredientTF = UITextField(placeholder: "Ингредиент")
    let resultCountLabel = UILabel(text: "0.0", font: FontsLibrary.mainLabelText)
    let solveButton = UIButton(title: "Посчитать", bgColor: .systemGreen, textColor: .white)
    let memoryButton = UIButton(title: "Запомнить", bgColor: .systemMint, textColor: .white)
    let tableView = UITableView()
    let plusButton = PlusButton()
    let measurePicker = UIPickerView()
    let ingredientPicker = UIPickerView()
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    func setViews() {
        tableView.register(PositionCell.self, forCellReuseIdentifier: PositionCell.reuseID)
        initCountTF.keyboardType = .decimalPad
        initMeasureTF.inputView = measurePicker
        resultMeasureTF.inputView = measurePicker
        ingredientTF.inputView = ingredientPicker
        bgImageView.contentMode = .scaleAspectFill
        plusButton.layer.cornerRadius = 32
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        
        resultCountLabel.textAlignment = .right
        resultCountLabel.layer.cornerRadius = 12
        resultCountLabel.clipsToBounds = true
        
        let roundViews = [solveButton, memoryButton, tableView]
        
        for view in roundViews {
            view.layer.cornerRadius = 12
        }
        tableView.backgroundColor = ColorsLibrary.blackAlpha
        plusButton.layer.shadowColor = UIColor.orange.cgColor
        plusButton.layer.shadowRadius = 9
        plusButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        plusButton.layer.shadowOpacity = 0.5
    }
    
    func setConstraints() {
        addSubview(bgImageView)
        
        let initStack = UIStackView(views: [initCountTF, initMeasureTF],
                                    axis: .horizontal,
                                    spacing: 12)
        let resultStack = UIStackView(views: [resultCountLabel, resultMeasureTF],
                                      axis: .horizontal, spacing: 12)
        let stack = UIStackView(views: [initStack, resultStack, ingredientTF, solveButton, memoryButton, tableView], axis: .vertical, spacing: 12)
        addSubview(stack)
        addSubview(plusButton)
        for view in stack.arrangedSubviews {
            if !(view is UITableView) {
                view.heightAnchor.constraint(equalToConstant: 48).isActive = true
            }
        }
        
        let fields = [initMeasureTF, initCountTF, resultMeasureTF]
        
        for field in fields {
            field.widthAnchor.constraint(equalTo: initMeasureTF.widthAnchor).isActive = true
        }
        
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bgImageView.topAnchor.constraint(equalTo: topAnchor),
                                     bgImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     bgImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        NSLayoutConstraint.activate([plusButton.widthAnchor.constraint(equalToConstant: 64),
                                     plusButton.heightAnchor.constraint(equalToConstant: 64),
                                     plusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                                     plusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90)])
        NSLayoutConstraint.activate([stack.topAnchor.constraint(equalTo: topAnchor, constant: 50),
                                     stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
                                     stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
