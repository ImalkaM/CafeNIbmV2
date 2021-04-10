//
//  FoodCart.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-06.
//

import Foundation


struct FoodCart {
    var initialPrice: Float
    var qty: Int
    var name: String
    var totalPriceSingleItem: Double
    
    
    //    static func calculateOrderTotalPrice(cartDetails:[FoodCart],totalPrice: Double) -> Double {
    //
    //        totalPriceOrder + Double(cartDetails[indexPath.row].initialPrice)
    //    }
    
    //    func plusButtonLogic(cartDetails:FoodCart){
    //
    //        let intitalPrice = cartDetails.initialPrice
    //        cartDetails.qty += 1
    //        cartDetails[indexPath.row].totalPriceSingleItem = intitalPrice * Float(cartDetails[indexPath.row].qty)
    //    }
    
    func calculateTotalPriceSingleItem(cartQty:FoodCart, intitalPrice:Double) -> Double{
        
        return intitalPrice * Double(cartQty.qty)
    }
}

