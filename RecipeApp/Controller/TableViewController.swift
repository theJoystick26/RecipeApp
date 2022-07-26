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
        
        textField.autocapitalizationType = .words
        
        textField.delegate = self
        recipeBook.delegate = self
        
        self.registerTableViewCells()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        
        recipeBook.performRequest(with: "chicken")
    }
    
    // MARK: - Registering Custom Cell
    
    private func registerTableViewCells() {
        let recipeCell = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        tableView.register(recipeCell, forCellReuseIdentifier: "RecipeCell")
    }
    
    // MARK: - Table View Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeTableViewCell
        
        cell.name.text = recipes[indexPath.row].name
        cell.yield.text = recipes[indexPath.row].yield.description
        cell.ingredients.text = recipes[indexPath.row].ingredients.joined(separator: ", ")
        cell.calories.text = recipes[indexPath.row].calories.description
        cell.totalTime.text = recipes[indexPath.row].totalTime.description
        
        return cell
    }
}

// MARK: - Recipe Book Delegate Methods

extension TableViewController: RecipeBookDelegate {
    func didFetchRecipes(_ recipeBook: RecipeBook, _ recipes: [Recipe]) {
        DispatchQueue.main.async {
            self.recipes = recipes
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

// MARK: - UITextField Delegate Methods

extension TableViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Type something..."
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let recipe = textField.text {
            recipeBook.performRequest(with: recipe)
        }
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
