//
//  Extensions.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-10.
//

import Foundation


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
