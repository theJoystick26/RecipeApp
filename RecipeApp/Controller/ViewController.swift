//
//  ViewController.swift
//  RecipeApp
//
//  Created by Adin Joyce on 7/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    let recipeBook = RecipeBook()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View loaded.")
        
        recipeBook.fetchRecipes(with: "chicken")
    }


}

