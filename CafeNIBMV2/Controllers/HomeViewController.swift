//
//  HomeViewController.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-03.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var orderButtonView: UIView!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var cartTableView: UITableView!
    
    @IBOutlet weak var orderbutton: UIButton!
    
    @IBOutlet weak var labelOrder: UILabel!
    
    var totalPriceOrder = 0.0
    
    let db = Firestore.firestore()
    
    let foodDetails: [FoodDetails] = [
        FoodDetails(name: "Rolls", description: "Special recipe, Try it now.Special recipe, Try it now.Special recipe, Try it now.Special recipe, Try it now.", price: 59.89, image: "download"),
        FoodDetails(name: "Kottu", description: "Special recipe, Try it now.", price: 100.00, image: ""),
        FoodDetails(name: "Rolls", description: "Special recipe, Try it now.", price: 59.89, image: "")
    ]
    
    var cartDetails:[FoodCart] = [FoodCart]()
    //var orderDetails:[OderDetails] = [OderDetails]()
    var cartQTY = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        cartTableView.dataSource = self
        cartTableView.delegate = self
        
        mainTableView.register(UINib(nibName: K.nibName, bundle: nil), forCellReuseIdentifier: K.mainTableCell)
        cartTableView.register(UINib(nibName: K.nibNameCartTable, bundle: nil), forCellReuseIdentifier: K.cartTableCell)
        // Do any additional setup after loading the view.
        orderButtonView.layer.cornerRadius = 25
        
        
        labelOrder.text = String(totalPriceOrder)
       
    }
    
//    func calculateTotalPrice() -> Double {
//
//        var tempPrice = 0.0
//        for items in cartDetails{
//            tempPrice = Totalprice + Double(items.initialPrice)
//        }
//        return tempPrice
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        cartTableView.reloadData()
        labelOrder.text = String(format:"%.2f", totalPriceOrder)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
   
    
    @IBAction func orderBtnPressed(_ sender: Any) {
        
        var foodInfo:[OderDetails.orderFoodDetails] = [OderDetails.orderFoodDetails]()
        
        for items in cartDetails{
            foodInfo.append(OderDetails.orderFoodDetails(name: items.name, qty: items.qty, intialPrice: Double(items.initialPrice)))
        }
        var foods:[NSDictionary] = []
        
        for item in cartDetails {
            let dic = [
                "name":item.name,
                "quentity":item.qty,
                "price":item.totalPriceSingleItem
            ] as [String : Any]
            
            foods.append(dic as NSDictionary)
        }
        
        db.collection("orders").addDocument(data: [
            "time": Date(),
            "Items":  foods ,
            "price": totalPriceOrder,
            "status":1
        ]) { err in
            if let err = err {
                let alert = UIAlertController(title: "Error", message: err.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            } else {
                self.cartDetails.removeAll()
                
                self.cartTableView.reloadData()
    //            self.foodDetails.removeAll()
//                self.appDelegate.cartCount = 0
                self.totalPriceOrder = 0
                let alert = UIAlertController(title: "Success", message: "Order Placed Successfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }
        
    }
    
}
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == mainTableView{
            return foodDetails.count
        }
        if tableView == cartTableView{
           return cartDetails.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == mainTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.mainTableCell, for: indexPath) as! FoodSelectCell
            
            cell.foodTitleLabel.text = foodDetails[indexPath.row].name
            cell.foodDescriptionLabel.text = foodDetails[indexPath.row].description
            cell.priceLabel.text = String(foodDetails[indexPath.row].price)
            cell.foodImage.image = UIImage(named: "\(foodDetails[indexPath.row].image)")
            
            return cell
        }
        
        if tableView == cartTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cartTableCell, for: indexPath) as! CartTableViewCell
            
            cell.foodName.text = cartDetails[indexPath.row].name
            cell.foodPrice.text = String(format:"%.2f", cartDetails[indexPath.row].totalPriceSingleItem)
            cell.foodQTY.text = String(cartDetails[indexPath.row].qty)
            cell.delegate = self
            return cell
            
        }
        
        return UITableViewCell()
    }
    
}

extension HomeViewController: CartCellViewDelegate {
    
    func didTappedButton(with title: String, in cell: CartTableViewCell) {
        
        
        
        if title == "Plus"{
            if let indexPath = cartTableView.indexPath(for: cell){
                
                let intitalPrice = cartDetails[indexPath.row].initialPrice
                cartDetails[indexPath.row].qty += 1
                cartDetails[indexPath.row].totalPriceSingleItem = Double(intitalPrice * Float(cartDetails[indexPath.row].qty))
                
                totalPriceOrder = OderDetails.calculateOrderTotalPrice(totalPrice: totalPriceOrder, cartItems: cartDetails[indexPath.row])
                labelOrder.text = String(format:"%.2f",totalPriceOrder)
                DispatchQueue.main.async {
                    self.cartTableView.reloadData()
                }
                //labelOrder.text =  "Order (Rs.\(String(cartDetails[indexPath.row].totalPrice)))"
                //orderbutton.setTitle("Order (Rs.\())", for: .normal)
            }
        }
        if title == "Minus"{
            if let indexPath = cartTableView.indexPath(for: cell){
                
                let intitalPrice = cartDetails[indexPath.row].initialPrice
                cartDetails[indexPath.row].qty -= 1
                cartDetails[indexPath.row].totalPriceSingleItem = Double(intitalPrice * Float(cartDetails[indexPath.row].qty))
                totalPriceOrder = totalPriceOrder - Double(cartDetails[indexPath.row].initialPrice)
                labelOrder.text = String(format:"%.2f",totalPriceOrder)
                
                if cartDetails[indexPath.row].qty == 0{
                    cartDetails.remove(at: indexPath.row)
                    cartTableView.deleteRows(at: [indexPath], with: .fade)
                    //orderDetails.remove(at: indexPath.row)
                    
                }
                
                DispatchQueue.main.async {
                    self.cartTableView.reloadData()
                }
               // labelOrder.text =  "Order (Rs.\(String(cartDetails[indexPath.row].totalPrice)))"
            }
            
        }
        
//        for items in cartDetails {
//            orderDetails[IndexPath.row]
//        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == mainTableView{
            self.performSegue(withIdentifier: K.FoodTableToFoodDetailsSeauge, sender: self)
        }
        if tableView == cartTableView{
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! FoodDetailsViewController
        
        if let indexPath = mainTableView.indexPathForSelectedRow {
            
            secondViewController.price = Float(foodDetails[indexPath.row].price)
            secondViewController.foodDescription = foodDetails[indexPath.row].description
            secondViewController.name = foodDetails[indexPath.row].name
            secondViewController.image = foodDetails[indexPath.row].image
        }
    }
}
