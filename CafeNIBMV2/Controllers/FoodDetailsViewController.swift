//
//  FoodDetailsViewController.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-04.
//

import UIKit
import Firebase

class FoodDetailsViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    var price:Float = 0.0
    var image:String = ""
    var name:String = ""
    var foodDescription:String = ""
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodNamelabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceLabel.text = String(price)
        foodImage.image = UIImage(named: "\(image)")
        descriptionLabel.text = foodDescription
        foodNamelabel.text = name
        
        addToCartButton.layer.cornerRadius = 25
        addToCartButton.addConstraint(addToCartButton.heightAnchor.constraint(equalToConstant: 50))
       
    }
    
    @IBAction func addToCartTapped(_ sender: UIButton) {
        
       
            db.collection(K.FStoreCart.collectionNameCartTable).addDocument(data:
                                                                                [
                                                                                 K.FStoreCart.foodNameField: name,
                                                                                 K.FStoreCart.qtyField: 1,
                                                                                 K.FStoreCart.priceField: price
                                                                                ]
            ) { (error) in
                if let e = error{
                    print("There was an issue saving data to firestore, \(e)")
                }else{
                    print("Sucessfully saved data")
                }
            }
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
