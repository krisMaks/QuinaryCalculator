//
//  ViewController.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 24.02.2022.
//

import UIKit

protocol AddMeasureDelegate {
    func measureHasBeenAdded()
}

protocol AddIngredientDelegate {
    func ingredientHasBeenAdded()
}

class MainViewController: UIViewController {
    
    var initMeasure = Measure(title: "кг", koeff: 1, measureType: .weight) {
        didSet {
            mainView.initMeasureTF.text = initMeasure.title
        }
    }
    var initResult = Measure(title: "кг", koeff: 1, measureType: .weight) {
        didSet {
            mainView.resultMeasureTF.text = initResult.title
        }
    }
    var initIngredient = Ingredient(title: "Вода", density: 1) {
        didSet {
            mainView.ingredientTF.text = initIngredient.title
        }
    }
    var positions = [Position]() {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    var measuresFromDB = [Measure]()
    var ingredientsFromDB = [Ingredient]()
    var isInit = true
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        navigationController?.isNavigationBarHidden = true
        addActions()
        mainView.measurePicker.delegate = self
        mainView.measurePicker.dataSource = self
        mainView.ingredientPicker.delegate = self
        mainView.ingredientPicker.dataSource = self
        mainView.initMeasureTF.delegate = self
        mainView.resultMeasureTF.delegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        getMeasureFromDB()
        getIngredientFromDB()
    }
    
    func getMeasureFromDB() {
        measuresFromDB = DatabaseService.shared.getMeasures()
    }
    
    func getIngredientFromDB() {
        ingredientsFromDB = DatabaseService.shared.getIngredients()
    }
    
    func addActions() {
        let calculateAction = UIAction { _ in
            self.calculate()
        }
        mainView.solveButton.addAction(calculateAction, for: .touchUpInside)
        
        let memoryAction = UIAction { _ in
            self.memory()
        }
        mainView.memoryButton.addAction(memoryAction, for: .touchUpInside)
        
        let plusAction = UIAction {_ in
            let actionSheet = UIAlertController(title: "Что вы хотите добавить?", message: nil, preferredStyle: .actionSheet)
            let measureAction = UIAlertAction(title: "Единицу измерения", style: .default) { _ in
                let vc = AddMeasureController()
                vc.delegate = self
                self.present(vc, animated: true)
            }
            let ingredientAction = UIAlertAction(title: "Ингредиент", style: .default) { _ in
                let vc = AddIngredientController()
                vc.delegate = self
                self.present(vc, animated: true)
            }
            let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            actionSheet.addAction(measureAction)
            actionSheet.addAction(ingredientAction)
            actionSheet.addAction(cancel)
            
            self.present(actionSheet, animated: true)
        }
        mainView.plusButton.addAction(plusAction, for: .touchUpInside)
    }
    
    func calculate() {
        guard let initCount = mainView.initCountTF.text else { return }
        guard let count = Double(initCount) else { return }
        let initType = MeasureType(initMeasure.measureType)
        let resultType = MeasureType(initResult.measureType)
        var result = 0.0
        switch (initType, resultType) {
        case (.weight, .weight), (.volume, .volume):
            result = count * initMeasure.koeff / initResult.koeff
        case (.volume, .weight):
            result = (count * initMeasure.koeff / initResult.koeff) / initIngredient.density
        case (.weight, .volume):
            result = (count * initMeasure.koeff / initResult.koeff) * initIngredient.density
        }
        mainView.resultCountLabel.text = String(format: "%.3f", result)
    }
    
    func memory() {
        guard let countStr = mainView.resultCountLabel.text else { return }
        guard let count = Double(countStr) else { return }
        let position = Position(engredient: initIngredient, measure: initMeasure, count: count)
        positions.append(position)
        mainView.initCountTF.text = ""
        mainView.initMeasureTF.text = ""
        mainView.resultMeasureTF.text = ""
        mainView.ingredientTF.text = ""
        mainView.resultCountLabel.text = ""
    }
    
}

extension MainViewController: AddMeasureDelegate {
    func measureHasBeenAdded() {
        getMeasureFromDB()
    }
}

extension MainViewController: AddIngredientDelegate {
    func ingredientHasBeenAdded() {
        getIngredientFromDB()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return positions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PositionCell.reuseID) as! PositionCell
        cell.titleLabel.text = positions[indexPath.row].engredient.title
        cell.countLabel.text = "\(positions[indexPath.row].count) \(positions[indexPath.row].measure.title)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Удалить") { _, _, _ in
            self.positions.remove(at: indexPath.row)
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == mainView.initMeasureTF {
            isInit = true
        } else {
            isInit = false
        }
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == mainView.measurePicker {
            return measuresFromDB.count
        } else {
            return ingredientsFromDB.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == mainView.measurePicker {
            return measuresFromDB[row].title
        } else {
            return ingredientsFromDB[row].title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == mainView.measurePicker {
            if isInit {
                initMeasure = measuresFromDB[row]
            } else {
                initResult = measuresFromDB[row]
            }
        } else {
            initIngredient = ingredientsFromDB[row]
        }
        self.mainView.endEditing(true)
    }
}
