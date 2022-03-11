//
//  NewRecipeView.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 03.03.2022.
//

import UIKit

class NewRecipeView: UIView {

    var imageView = UIImageView()
    var titleTF = UITextField(placeholder: "Название блюда")
    var descriptionLabel = UILabel(text: "Описание:", font: FontsLibrary.mainLabelText)
    var descriptionTextView = UITextView()
    var ingredientsTF = UITextField(placeholder: "Ингредиенты")
    var categoryPicker = UIPickerView()
    var saveButton = UIButton(title: "Сохранить", bgColor: ColorsLibrary.green, textColor: .white)
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
    
    func setViews() {
        backgroundColor = .white
        
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.textColor = .black
        
        imageView.backgroundColor = .systemCyan
        imageView.clipsToBounds = false
        imageView.layer.cornerRadius = 12
        imageView.layer.shadowRadius = 4
        imageView.layer.shadowColor = UIColor.blue.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowOpacity = 0.2
        imageView.isUserInteractionEnabled = true
        
        descriptionTextView.backgroundColor = .white
        descriptionTextView.clipsToBounds = false
        descriptionTextView.layer.cornerRadius = 12
        descriptionTextView.layer.shadowRadius = 4
        descriptionTextView.layer.shadowColor = UIColor.black.cgColor
        descriptionTextView.layer.shadowOffset = CGSize(width: 0, height: 0)
        descriptionTextView.layer.shadowOpacity = 0.2
        
    }
    
    func setConstraints() {
        let stackView = UIStackView(views: [imageView, titleTF, ingredientsTF, categoryPicker, descriptionLabel, descriptionTextView, saveButton],
                                    axis: .vertical,
                                    spacing: 12)
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 180),
            categoryPicker.heightAnchor.constraint(equalToConstant: 140)
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
