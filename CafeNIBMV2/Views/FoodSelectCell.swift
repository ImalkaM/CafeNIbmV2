//
//  FoodSelectCell.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-04.
//

import UIKit

class FoodSelectCell: UITableViewCell {

    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
