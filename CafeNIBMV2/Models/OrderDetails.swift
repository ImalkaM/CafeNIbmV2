//
//  OrderDetails.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-07.
//

import Foundation

struct OderDetails {
    var Id: Int
    var dateTime: Date
    var foodDetais: [orderFoodDetails] =  [orderFoodDetails]()
    var totalPrice: Float
    
    
    struct orderFoodDetails {
        var name:String
        var qty:Int
        var intialPrice:Double
    }
    
    struct orderCell {
        var id:UUID
        var status:String
    }
    
    static func calculateOrderTotalPrice(totalPrice:Double, cartItems:FoodCart) -> Double{
        
        return totalPrice + Double(cartItems.initialPrice)
    }
    
    enum status:String {
        case waitingtoccept
        case waitingtoaccept
        case waitingtoaccept
        
    }
}




