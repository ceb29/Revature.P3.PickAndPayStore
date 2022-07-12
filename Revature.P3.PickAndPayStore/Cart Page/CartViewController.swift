//
//  CartViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Conner Donnelly on 7/5/22.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var itemName : [String] = ["Wakeboard","Coffee Max 3.0","LED Mechanical Keyboard","Children's Life Jacket","Wakemaster Alarm Clock","Alienware PC Gaming Tower 32G Ram, RGB RTX 3090 Ti","Overseer Welcome Kit","RGB LED Light Strips","Staple Remover"]
    var itemPrice : [Double] = [40.00,59.69,235.99,23.39,53.67,2500.99,153.44,30.00,1.96]
    
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    let viewModel = cartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updatePricing()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemPrice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        cell.itemNameLabel.text = itemName[indexPath.row]
        cell.itemPriceLable.text = String(format: "$%.2f",itemPrice[indexPath.row])
        return cell
    }
    @IBAction func continueShoppingTap(_ sender: Any) {
        
    }
    @IBAction func checkoutTap(_ sender: Any) {
        
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    //need to switch this over to MVVM standard
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        itemName.remove(at: indexPath.row)
        itemPrice.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        self.updatePricing()
    }
    func updatePricing(){
//        let subTotal = self.subTotal(items:itemPrice)
//        let estimatedTax = self.estimateTax(subTotal: subTotal)
//        let total = self.total(subTotal: subTotal, estimatedTax: estimatedTax)
        viewModel.recalc()
        viewModel.subTotal(items: itemPrice)
        subTotalLabel.text = String(format:"Sub Total: $%.2f",viewModel.subTotal)
        taxLabel.text = String(format:"Estimated Tax: $%.2f",viewModel.estimatedTax)
        totalLabel.text = String(format:"Total: $%.2f",viewModel.total)
    }
//    func subTotal (items: [Double]) -> Double {
//        var subTotal : Double = 0
//        for item in items{
//            subTotal = subTotal + item
//        }
//        return subTotal
//    }
//    func estimateTax(subTotal:Double) -> Double {
//        let tax = 0.06875
//        let estimatedTax = subTotal * tax
//        return estimatedTax
//    }
//
//    func total (subTotal:Double,estimatedTax:Double) -> Double {
//        let total = subTotal + estimatedTax
//        return total
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
