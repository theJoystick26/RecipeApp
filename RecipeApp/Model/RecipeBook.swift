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
            "app_id": Bundle.main.object(forInfoDictionaryKey: "app_id") as! String,
            "app_key": Bundle.main.object(forInfoDictionaryKey: "app_key") as! String
        ]
        
        AF.request(URL(string: url)!, method: .get, parameters: params).response { response in
            
            if let value = response.value {
                if let data = value {
                    let json = JSON(data)
                    if let hits = json["hits"].array {
                        for hit in hits {
                            print(hit)
                        }
                    }
                }
            }
        }
    }
}
