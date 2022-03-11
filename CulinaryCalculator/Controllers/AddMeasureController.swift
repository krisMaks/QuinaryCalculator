//
//  AddMeasureController.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 25.02.2022.
//

import UIKit

class AddMeasureController: UIViewController {
    
    let measureView = AddMeasureView()
    var delegate: AddMeasureDelegate?
    
    var selectedSegment: Int {
        return measureView.typeSegmentControl.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = measureView
        addActions()
    }
    
    func addActions() {
        let changeSC = UIAction { _ in
            if self.measureView.typeSegmentControl.selectedSegmentIndex == 0 {
                self.measureView.koeffTF.placeholder = "Сколько в нем кг"
            } else {
                self.measureView.koeffTF.placeholder = "Сколько в нем литров"
            }
        }
        measureView.typeSegmentControl.addAction(changeSC, for: .valueChanged)
        
        let saveMeasure = UIAction { _ in
            self.addMeasure()
        }
        measureView.saveButton.addAction(saveMeasure, for: .touchUpInside)
    }
    
    func addMeasure() {
        guard let title = measureView.titleTF.text else { return }
        guard let koeffStr = measureView.koeffTF.text else { return }
        guard let koeff = Double(koeffStr) else { return }
        
        var measureType = MeasureType.weight
        
        if selectedSegment == 1 {
            measureType = .volume
        }
        let newMeasure = Measure(title: title, koeff: koeff, measureType: measureType)
        DatabaseService.shared.createMeasure(newMeasure) {
            delegate?.measureHasBeenAdded()
            self.dismiss(animated: true)
        }
    }
}
