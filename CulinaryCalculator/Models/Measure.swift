//
//  Measure.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 24.02.2022.
//

import Foundation
import RealmSwift

enum MeasureType: String {
    case weight = "Вес"
    case volume = "Объем"
    
    init(_ value: String) {
        switch value {
        case "Вес": self = .weight
        default: self = .volume
        }
    }
}

class Measure: Object {
    @Persisted var title: String = ""
    @Persisted var koeff: Double = 0.0
    @Persisted var measureType: String = ""
    
    convenience init(title: String, koeff: Double, measureType: MeasureType) {
        self.init()
        self.title = title
        self.koeff = koeff
        self.measureType = measureType.rawValue
    }
}
