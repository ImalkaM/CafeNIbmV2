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
        
        performSegue(withIdentifier: K.FooddetailsToHomeUnwindSeauge, sender:self)
        
//            db.collection(K.FStoreCart.collectionNameCartTable).addDocument(data:
//                                                                                [
//                                                                                 K.FStoreCart.foodNameField: name,
//                                                                                 K.FStoreCart.qtyField: 1,
//                                                                                 K.FStoreCart.priceField: price
//                                                                                ]
//            ) { (error) in
//                if let e = error{
//                    print("There was an issue saving data to firestore, \(e)")
//                }else{
//                    print("Sucessfully saved data")
//                }
//            }
        
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeVC = segue.destination as! HomeViewController
        
        homeVC.cartDetails.append(FoodCart(initialPrice: price, qty: 1, name: name, totalPriceSingleItem: Double(price)))
//        homeVC.orderDetails.append(OderDetails(Id: 1, dateTime: Date(), foodDetais: FoodDetails(name: name, description: description, price: price, image: ""), totalPrice: 0))
        homeVC.totalPriceOrder += Double(price)
        //print(homeVC.orderDetails)
    }
}
