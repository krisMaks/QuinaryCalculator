//
//  Category.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 03.03.2022.
//

import Foundation

enum Category: String, CaseIterable {
    case first = "Первое"
    case second = "Второе"
    case desert = "Десерт"
    
    init(_ value: String) {
        switch value {
        case "Первое":
            self = .first
        case "Второе":
            self = .second
        case "Десерт":
            self = .desert
        default:
            self = .first
        }
    }
}
