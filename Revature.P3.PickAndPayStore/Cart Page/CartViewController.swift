//
//  CartViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Conner Donnelly on 7/5/22.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var cartTable: UITableView!
    var cartItems:[CartItemViewModel] = []
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    let viewModel = cartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        //set up the cartItems from the global cart
        super.viewWillAppear(true)
        cartItems = OrderDetailsService.orderDetailsServiceInstance.getCheckoutData()
        cartTable.reloadData()
        self.updatePricing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        let price = Double(cartItems[indexPath.row].price)
        cell.itemNameLabel.text = cartItems[indexPath.row].name
        cell.itemPriceLable.text = String(format: "$%.2f",price ?? 0)
        return cell
    }
    
    @IBAction func checkoutTap(_ sender: Any) {
        if CurrentUser.currentUser.name != "Guest"{
            let storyObject = UIStoryboard(name: "PaymentStoryboardHost", bundle: nil)
            let shippingVC = storyObject.instantiateViewController(withIdentifier: "ShippingVC")
            self.navigationController?.pushViewController(shippingVC, animated: true)
        }else{
            self.present(viewModel.dialogLogin, animated: true, completion: nil)
            viewModel.dialogLogin.addAction(viewModel.acknowledge)
        }
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove Item"
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    //need to switch this over to MVVM standard
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        DBHelperCheckoutItem.dbHelper.deleteCartItemData(productID: cartItems[indexPath.row].productID)
        cartItems = OrderDetailsService.orderDetailsServiceInstance.getCheckoutData()
        tableView.deleteRows(at: [indexPath], with: .fade)
        self.updatePricing()
    }
    func updatePricing(){
        viewModel.recalc(items:cartItems) //sets the values in viewModel back to zero & passes the list in the cart to calculate the subTotal, Tax and Total
        subTotalLabel.text = String(format:"Sub Total: $%.2f",viewModel.subTotal)
        taxLabel.text = String(format:"Estimated Tax: $%.2f",viewModel.estimatedTax)
        totalLabel.text = String(format:"Total: $%.2f",viewModel.total)
    }

}
