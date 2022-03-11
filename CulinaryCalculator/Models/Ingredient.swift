//
//  Engredient.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 24.02.2022.
//

import Foundation
import RealmSwift

class Ingredient: Object {
    @Persisted var title: String = ""
    @Persisted var density: Double = 0.0
    
    convenience init(title: String, density: Double) {
        self.init()
        self.title = title
        self.density = density
    }
}
