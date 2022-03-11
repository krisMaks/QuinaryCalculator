//
//  Recipe.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 02.03.2022.
//

import Foundation
import RealmSwift

class Recipe: Object {
    @Persisted var title = ""
    @Persisted var image = Data()
    @Persisted var ingredients = ""
    @Persisted var descript = ""
    @Persisted var category = ""
    
    convenience init(title: String, image: Data, ingredients: String, description: String, category: Category) {
        self.init()
        
        self.title = title
        self.image = image
        self.ingredients = ingredients
        self.descript = description
        self.category = category.rawValue
    }
}
