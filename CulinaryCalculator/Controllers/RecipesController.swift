//
//  RecipesController.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 02.03.2022.
//

import UIKit

protocol AddRecipeDelegate {
    func addedNewRecipe()
}

class RecipesController: UIViewController {

    let recipesView = RecipesView()
    var recipes = [Recipe]() {
        didSet {
            self.recipesView.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = recipesView
        addActions()
        recipesView.collectionView.delegate = self
        recipesView.collectionView.dataSource = self
        getResipes()
    }
    
    func addActions() {
        let plusAction = UIAction { _ in
            let newRecipeController = NewRecipeController()
            newRecipeController.delegate = self
            self.present(newRecipeController, animated: true)
        }
        self.recipesView.plusButton.addAction(plusAction, for: .touchUpInside)
    }
    
    func getResipes() {
        recipes = DatabaseService.shared.getRecipes()
    }
    
    @objc func deleteRecipe(_ sender: DeleteButtonInCell) {
        let actionSheet = UIAlertController(title: "Вы точно хотите удалить этот рецепт?", message: nil, preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "Да", style: .destructive) { _ in
            DatabaseService.shared.remove(recipe: self.recipes[sender.indexPath.item]) {
                self.getResipes()
            }
        }
        let noAction = UIAlertAction(title: "Нет", style: .cancel, handler: nil)
        actionSheet.addAction(yesAction)
        actionSheet.addAction(noAction)
        present(actionSheet, animated: true)
    }
}

extension RecipesController: AddRecipeDelegate {
    func addedNewRecipe() {
        getResipes()
    }
}


extension RecipesController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipesCell.reuseID, for: indexPath) as! RecipesCell
        cell.layer.cornerRadius = 12
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.15
        cell.layer.shadowRadius = 4
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.titleLabel.text = recipes[indexPath.item].title
        cell.imageView.image = UIImage(data: recipes[indexPath.item].image)
        cell.deleteButton.indexPath = indexPath
        cell.deleteButton.addTarget(self, action: #selector(deleteRecipe), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = RecipeDetailController()
        vc.recipe = recipes[indexPath.item]
        present(vc, animated: true)
    }
}
