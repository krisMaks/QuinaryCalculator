//
//  RecipeDetailController.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 03.03.2022.
//

import UIKit

class RecipeDetailController: UIViewController {

    let detailView = RecipeDetailView()
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        setViews()
    }
    
    func setViews() {
        guard let recipe = recipe else { return }
        detailView.titleLabel.text = recipe.title
        detailView.descriptionTextView.text = recipe.descript
        detailView.imageView.image = UIImage(data: recipe.image)
        detailView.categoryLabel.text = recipe.category
        detailView.ingredientsLabel.text = recipe.ingredients

    }
  

}
