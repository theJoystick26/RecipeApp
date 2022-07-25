//
//  TableViewController.swift
//  RecipeApp
//
//  Created by Adin Joyce on 7/25/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    let recipeBook = RecipeBook()
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        recipeBook.delegate = self
        
        recipeBook.performRequest(with: "chicken")
    }

    // MARK: - Table View Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProtoCell", for: indexPath)
        
        cell.textLabel?.text = recipes[indexPath.row].name

        return cell
    }
    
}

// MARK: - Recipe Book Delegate Methods

extension TableViewController: RecipeBookDelegate {
    func didFetchRecipes(_ recipeBook: RecipeBook, _ recipes: [Recipe]) {
        DispatchQueue.main.async {
            for recipe in recipes {
                self.recipes.append(recipe)
            }
            
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

// MARK: - UITextField Delegate Methods

extension TableViewController: UITextFieldDelegate {
    
}
