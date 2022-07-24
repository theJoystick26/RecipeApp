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
    let yield: Float
    let ingredients: [String]
    let calories: Float
    let totalTime: Float
    
    init(_ name: String, _ imageUrl: String, _ yield: Float, _ ingredients: [String], _ calories: Float, _ totalTime: Float) {
        self.name = name
        self.imageUrl = imageUrl
        self.yield = yield
        self.ingredients = ingredients
        self.calories = calories
        self.totalTime = totalTime
    }
}
