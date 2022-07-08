//
//  CartViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Conner Donnelly on 7/5/22.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var subTotal: UILabel!
    @IBOutlet weak var tax: UILabel!
    @IBOutlet weak var total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func continueShoppingTap(_ sender: Any) {
    }
    @IBAction func checkoutTap(_ sender: Any) {
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
