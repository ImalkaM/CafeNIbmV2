//
//  OrderTableViewCell.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-10.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
