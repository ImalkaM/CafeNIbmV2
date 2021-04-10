//
//  OrderViewController.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-10.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var orderTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orderTableView.dataSource = self
        
        orderTableView.register(UINib(nibName: K.nibNameOrderTable, bundle: nil), forCellReuseIdentifier: K.orderTableCell)
    }
    

}
extension OrderViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.orderTableCell, for: indexPath) as! OrderTableViewCell
        
         cell.idLabel.text = "dsf"
//        cell.foodPrice.text = String(format:"%.2f", cartDetails[indexPath.row].totalPriceSingleItem)
//        cell.foodQTY.text = String(cartDetails[indexPath.row].qty)
        //cell.delegate = self
        return cell
    }
     
}
