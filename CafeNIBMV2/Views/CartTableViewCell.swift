//
//  CartTableViewCell.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-06.
//

import UIKit

protocol CartCellViewDelegate:AnyObject {
    
    func didTappedButton(with title: String, in cell: CartTableViewCell)
}



class CartTableViewCell: UITableViewCell {

    weak var delegate:CartCellViewDelegate?
   
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodQTY: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func minusBtbTapped(_ sender: Any) {
        
        delegate?.didTappedButton(with: "Minus", in: self)
    }
    @IBAction func plusBtnTapped(_ sender: Any) {
      
        
        delegate?.didTappedButton(with: "Plus", in: self)

    }
}
