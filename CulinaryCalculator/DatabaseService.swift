//
//  DatabaseService.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 25.02.2022.
//

import Foundation
import RealmSwift

class DatabaseService {
    
    static let shared = DatabaseService()
    private let db = try! Realm()
    
    var databaseURL: String {
        return String(describing: db.configuration.fileURL)
    }
    
    private init() {}
    
    func remove(recipe: Recipe, completion: () -> ()) {
        try? db.write {
            db.delete(recipe)
        }
        completion()
    }
    
    func createMeasure(_ measure: Measure, completion: () -> ()) {
        try? db.write {
            db.add(measure)
        }
        completion()
    }
    
    func createIngredient(_ ingredient: Ingredient, completion: () -> ()) {
        try? db.write {
            db.add(ingredient)
        }
        completion()
    }
    
    func createRecipe(_ recipe: Recipe, completion: () -> ()) {
        try? db.write {
            db.add(recipe)
        }
        completion()
    }
    
    func getRecipes() -> [Recipe] {
        let objects = db.objects(Recipe.self)
        var recipes = [Recipe]()
        
        if objects.count > 0 {
            for object in objects {
                recipes.append(object)
            }
        } else {
            for recipe in initRecipes {
                self.createRecipe(recipe) {
                    print("\(recipe.title) добавлен!")
                }
            }
            recipes = initRecipes
        }
        return recipes
    }
    
    
    func getMeasures() -> [Measure] {
        let objects = db.objects(Measure.self)
        var measures = [Measure]()
        
        if objects.count > 0 {
            for object in objects {
                measures.append(object)
            }
        } else {
            for measure in initMeasures {
                self.createMeasure(measure) {
                    print("\(measure.title) добавлен!")
                }
            }
            measures = initMeasures
        }
        return measures
    }
    
    func getIngredients() -> [Ingredient] {
        let objects = db.objects(Ingredient.self)
        var ingredients = [Ingredient]()
        
        if objects.count > 0 {
            for object in objects {
                ingredients.append(object)
            }
        } else {
            for ingredient in initIngredients {
                self.createIngredient(ingredient) {
                    print("\(ingredient.title) добавлен!")
                }
            }
            ingredients = initIngredients
        }
        return ingredients
    }
    
    var initMeasures = [Measure(title: "кг", koeff: 1, measureType: .weight),
                        Measure(title: "г", koeff: 0.001, measureType: .weight),
                        Measure(title: "фунт", koeff: 0.454, measureType: .weight),
                        Measure(title: "л", koeff: 1, measureType: .volume),
                        Measure(title: "м³", koeff: 1000, measureType: .volume)
    ]
    
    var initIngredients = [Ingredient(title: "Вода", density: 1),
                           Ingredient(title: "Рис", density: 0.91)]
    
    var initRecipes = [
        Recipe(title: "Цезарь", image: (UIImage(named: "caesar")?.jpegData(compressionQuality: 0.3))!, ingredients: "Курица, яйца перепелинные, помидоры черри, салат айсберг, соус Цезарь", description: """
Как сделать салат Цезарь с помидорами, курицей и сухариками? Подготовьте все продукты по списку. Вымойте овощи, яйца, лимон. И обсушите их салфетками. Куриное филе очистите от пленок, вымойте и обсушите. Пармезан при необходимости можете заменить любым другим твердым сыром. Помидоры берите мелкие, но лучше черри.
""", category: .second),
        Recipe(title: "Котлета с пюре", image: (UIImage(named: "cutlet")?.jpegData(compressionQuality: 0.3))!, ingredients: "Куриный фарш, лук, морковь, картофель", description: """
Приготовьте вкусное пюре при помощи отваривания картофеля и взбейте его миксером. Куриный фарш пропустите через мясорубку вместе с морковью и луком. Поджарьте на сковороде до золотистой корочки.
""", category: .second),
        Recipe(title: "Борщ", image: (UIImage(named: "borsh")?.jpegData(compressionQuality: 0.3))!, ingredients: "Говядина, картофель, морковь, томат, лук, белокочанная капуста, картофель, лавровый лист, чеснок, зелень", description: """
Когда бульон сварится, выньте из него мясо. Пока оно остывает, засыпьте в кастрюлю нашинкованную капусту. Через 5–10 минут добавьте нарезанный соломкой или кубиками картофель.
Порядок закладки овощей можно менять. Если капуста молодая, её лучше добавить уже после картошки. Ну или одновременно, если ваш сорт картофеля разваривается быстро.
""", category: .first)
    ]
}
