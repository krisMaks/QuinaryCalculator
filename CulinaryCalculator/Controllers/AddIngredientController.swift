//
//  AddIngredientController.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 25.02.2022.
//

import UIKit

class AddIngredientController: UIViewController {
    
    let ingredientView = AddIngredientView()
    var delegate: AddIngredientDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = ingredientView
        addActions()
    }
    
    func addActions() {
        let saveMeasure = UIAction { _ in
            self.addIngredient()
        }
        ingredientView.saveButton.addAction(saveMeasure, for: .touchUpInside)
    }
    
    func addIngredient() {
        guard let title = ingredientView.titleTF.text else { return }
        guard let densityStr = ingredientView.densityTF.text else { return }
        guard let density = Double(densityStr) else { return }
        
        let newIngredient = Ingredient(title: title, density: density)
        DatabaseService.shared.createIngredient(newIngredient) {
            delegate?.ingredientHasBeenAdded()
            self.dismiss(animated: true)
        }
    }
}
