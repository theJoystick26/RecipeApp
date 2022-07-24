//
//  RecipeBook.swift
//  RecipeApp
//
//  Created by Adin Joyce on 7/23/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class RecipeBook {
    private let url = "https://api.edamam.com/api/recipes/v2"
    var recipes: [Recipe] = []
    
    func fetchRecipes(with recipe: String) {
        print("Function called.")
        
        let params = [
            "type": "public",
            "q": recipe,
            "app_id": Bundle.main.object(forInfoDictionaryKey: "app_id") as! String,
            "app_key": Bundle.main.object(forInfoDictionaryKey: "app_key") as! String
        ]
        
        AF.request(URL(string: url)!, method: .get, parameters: params).response { response in
            
            if let value = response.value {
                if let data = value {
                    let json = JSON(data)
                    self.parseJSON(json)
                }
            }
        }
    }
    
    func parseJSON(_ json: JSON) {
        if let hits = json["hits"].array {
            for hit in hits {
                if let name = hit["recipe"]["label"].string, let imageUrl = hit["recipe"]["image"].string, let yield = hit["recipe"]["yield"].float, let ingredients = hit["recipe"]["ingredientLines"].arrayObject as? [String], let calories = hit["recipe"]["calories"].float, let totalTime = hit["recipe"]["totalTime"].float {
                    let recipe = Recipe(name, imageUrl, yield, ingredients, calories, totalTime)
                    
                    recipes.append(recipe)
                }
            }
        }
        
        print(recipes)
    }
}
