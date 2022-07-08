//
//  CartViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Conner Donnelly on 7/5/22.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //var itemPrice : [String:Double] = ["W33576":40.00,"H447223":59.69,"E444424":235.99,"W342348":23.39]
   //var itemName : [String:String] = ["W33576":"Wakeboard","H447223":"Coffee Max 3.0","E444424":"LED Mechanical Keyboard","W342348":"Children's Life Jacket"]
    var itemName : [String] = ["Wakeboard","Coffee Max 3.0","LED Mechanical Keyboard","Children's Life Jacket","Wakemaster Alarm Clock","Alienware PC Gaming Tower 32G Ram, RGB RTX 3090 Ti","Overseer Welcome Kit","RGB LED Light Strips","Staple Remover"]
    var itemPrice : [Double] = [40.00,59.69,235.99,23.39,53.67,2500.99,153.44,30.00,1.96]
    
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var subTotal = self.subTotal(items:itemPrice)
        var estimatedTax = self.estimateTax(subTotal: subTotal)
        var total = self.total(subTotal: subTotal, estimatedTax: estimatedTax)
        subTotalLabel.text = String(format:"Sub Total: $%.2f",subTotal)
        taxLabel.text = String(format:"Estimated Tax: $%.2f",estimatedTax)
        totalLabel.text = String(format:"Total: $%.2f",total)
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
    
    func subTotal (items: [Double]) -> Double {
        var subTotal : Double = 0
        for item in items{
            subTotal = subTotal + item
        }
        return subTotal
    }
    func estimateTax(subTotal:Double) -> Double {
        let tax = 0.06875
        let estimatedTax = subTotal * tax
        return estimatedTax
    }
    
    func total (subTotal:Double,estimatedTax:Double) -> Double {
        let total = subTotal + estimatedTax
        return total
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
