//
//  ViewController.swift
//  RecipeApp
//
//  Created by Adin Joyce on 7/23/22.
//

import UIKit

class ViewController: UIViewController, RecipeBookDelegate {
    let recipeBook = RecipeBook()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        recipeBook.delegate = self
        
        recipeBook.performRequest(with: "chicken")
    }
    
    // MARK : - Recipe Book Delegate Methods
    
    func didFetchRecipes(_ recipeBook: RecipeBook, _ recipes: [Recipe]) {
        DispatchQueue.main.async {
            for recipe in recipes {
                print(recipe)
            }
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
}

