//
//  RecipeBook.swift
//  RecipeApp
//
//  Created by Adin Joyce on 7/23/22.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol RecipeBookDelegate {
    func didFetchRecipes(_ recipeBook: RecipeBook, _ recipes: [Recipe])
    func didFailWithError(_ error: Error)
}

class RecipeBook {
    private let url = "https://api.edamam.com/api/recipes/v2"
    var delegate: RecipeBookDelegate?
    
    func performRequest(with recipe: String) {
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
                    if let recipes = self.parseJSON(json) {
                        self.delegate?.didFetchRecipes(self, recipes)
                    }
                }
            }
        }
    }
    
    func parseJSON(_ json: JSON) -> [Recipe]? {
        var arr: [Recipe] = []
        
        if let hits = json["hits"].array {
            for hit in hits {
                if let name = hit["recipe"]["label"].string, let imageUrl = hit["recipe"]["image"].string, let yield = hit["recipe"]["yield"].float, let ingredients = hit["recipe"]["ingredientLines"].arrayObject as? [String], let calories = hit["recipe"]["calories"].float, let totalTime = hit["recipe"]["totalTime"].float {
                    let recipe = Recipe(name, imageUrl, yield, ingredients, calories, totalTime)
                    
                    arr.append(recipe)
                }
            }
        }
        
        return arr;
    }
}
