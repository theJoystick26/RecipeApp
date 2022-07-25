//
//  RecipeTableViewCell.swift
//  RecipeApp
//
//  Created by Adin Joyce on 7/25/22.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var yield: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
