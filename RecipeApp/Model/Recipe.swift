//
//  Recipe.swift
//  RecipeApp
//
//  Created by Adin Joyce on 7/23/22.
//

import Foundation
import UIKit

struct Recipe {
    let name: String
    let imageUrl: String
    let yield: Int
    let ingredients: [String]
    let calories: Int
    let totalTime: Int
    
    init(_ name: String, _ imageUrl: String, _ yield: Int, _ ingredients: [String], _ calories: Int, _ totalTime: Int) {
        self.name = name
        self.imageUrl = imageUrl
        self.yield = yield
        self.ingredients = ingredients
        self.calories = calories
        self.totalTime = totalTime
    }
}
