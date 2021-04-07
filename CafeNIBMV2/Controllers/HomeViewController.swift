//
//  HomeViewController.swift
//  CafeNIBMV2
//
//  Created by Imalka Muthukumara on 2021-04-03.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var cartTableView: UITableView!
    
    let foodDetails: [FoodDetails] = [
        FoodDetails(name: "Rolls", description: "Special recipe, Try it now.Special recipe, Try it now.Special recipe, Try it now.Special recipe, Try it now.", price: 59.89, image: "download"),
        FoodDetails(name: "Kottu", description: "Special recipe, Try it now.", price: 100.00, image: ""),
        FoodDetails(name: "Rolls", description: "Special recipe, Try it now.", price: 59.89, image: "")
    ]
    
    var cartDetails:[FoodCart] = [FoodCart]()
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
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        cartTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
}

extension HomeViewController: UITableViewDataSource{
    
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
            cell.foodPrice.text = String(cartDetails[indexPath.row].totalPrice)
            cell.foodQTY.text = String(cartDetails[indexPath.row].qty)
            cell.delegate = self
            return cell
            
        }
        
        return UITableViewCell()
    }
    
}

extension HomeViewController: CartCellViewDelegate{
    
    func didTappedButton(with title: String, in cell: CartTableViewCell) {
        
        
        
        if title == "Plus"{
            if let indexPath = cartTableView.indexPath(for: cell){
                
                let intitalPrice = cartDetails[indexPath.row].price
                cartDetails[indexPath.row].qty += 1
                cartDetails[indexPath.row].totalPrice = intitalPrice * Float(cartDetails[indexPath.row].qty)
                
                
                
                DispatchQueue.main.async {
                    self.cartTableView.reloadData()
                }
            }
            
        }
        if title == "Minus"{
            if let indexPath = cartTableView.indexPath(for: cell){
                
                let intitalPrice = cartDetails[indexPath.row].price
                cartDetails[indexPath.row].qty -= 1
                cartDetails[indexPath.row].totalPrice = intitalPrice * Float(cartDetails[indexPath.row].qty)
                
                if cartDetails[indexPath.row].qty == 0{
                    cartDetails.remove(at: indexPath.row)
                    cartTableView.deleteRows(at: [indexPath], with: .fade)
                }
                
                DispatchQueue.main.async {
                    self.cartTableView.reloadData()
                }
            }
        }
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
