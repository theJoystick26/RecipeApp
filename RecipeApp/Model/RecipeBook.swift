//
//  RecipeBook.swift
//  RecipeApp
//
//  Created by Adin Joyce on 7/23/22.
//

import Foundation
import Alamofire
import SwiftyJSON

struct RecipeBook {
    let url = "https://api.edamam.com/api/recipes/v2"
    
    func fetchRecipes(with recipe: String) {
        print("Function called.")
        
        let params = [
            "type": "public",
            "q": recipe,
            "app_id": UserDefaults.standard.string(forKey: "app_id"),
            "app_key": UserDefaults.standard.string(forKey: "app_key")
        ]
        
        AF.request(URL(string: url)!, method: .get, parameters: params).response { response in
            print(response.result)
        }
    }
}
