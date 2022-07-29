//
//  RecipeTableViewCell.swift
//  RecipeApp
//
//  Created by Adin Joyce on 7/25/22.
//

import UIKit
import Kingfisher

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var recipeView: UIStackView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var yield: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recipeView.layer.borderWidth = 5
        recipeView.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        recipeView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
