//
//  NewRecipeController.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 03.03.2022.
//

import UIKit

class NewRecipeController: UIViewController {

    let recipeView = NewRecipeView()
    var categoryText = "Первое"
    var delegate: AddRecipeDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        view = recipeView
        recipeView.categoryPicker.delegate = self
        recipeView.categoryPicker.dataSource = self
        addActions()
    }
    
    func addActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(showActionSheet))
        recipeView.imageView.addGestureRecognizer(tap)
        
        let save = UIAction { _ in
            guard let imageData = self.recipeView.imageView.image?.jpegData(compressionQuality: 0.4),
                  let title = self.recipeView.titleTF.text,
            let description = self.recipeView.descriptionTextView.text,
            let ingredients = self.recipeView.ingredientsTF.text
            else { return }
            let recipe = Recipe(title: title,
                                image: imageData,
                                ingredients: ingredients,
                                description: description,
                                category: Category.init(self.categoryText))
            DatabaseService.shared.createRecipe(recipe) {
                self.delegate?.addedNewRecipe()
                self.dismiss(animated: true)
            }
        }
        recipeView.saveButton.addAction(save, for: .touchUpInside)
    }
    
    
    @objc func showActionSheet() {
        let actionSheet = UIAlertController(title: "Откуда взять фото?",
                                            message: nil,
                                            preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Камера", style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.cameraDevice = .rear
            self.present(imagePicker, animated: true)
        }
        let galery = UIAlertAction(title: "Галерея",
                                   style: .default) { _ in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            self.present(imagePicker, animated: true)
        }
        let cancel = UIAlertAction(title: "Отмена",
                                   style: .cancel,
                                   handler: nil)
        actionSheet.addAction(camera)
        actionSheet.addAction(galery)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true)
    }
}

extension NewRecipeController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        recipeView.imageView.image = image
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

extension NewRecipeController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Category.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryText = Category.allCases[row].rawValue
    }
    
}
