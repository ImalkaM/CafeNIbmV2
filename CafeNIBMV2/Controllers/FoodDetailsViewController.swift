//
//  FoodDetailsViewController.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-04.
//

import UIKit

class FoodDetailsViewController: UIViewController {
    
    
    var price:Float = 0.0
    var image:String = ""
    var name:String = ""
    var foodDescription:String = ""
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodNamelabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceLabel.text = String(price)
        foodImage.image = UIImage(named: "\(image)")
        descriptionLabel.text = foodDescription
        foodNamelabel.text = name
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
