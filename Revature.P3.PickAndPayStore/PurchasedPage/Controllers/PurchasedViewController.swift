//
//  PurchasedViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/17/22.
//

import UIKit

class PurchasedViewController: UIViewController {

    @IBOutlet weak var itemTable : UITableView!
    @IBOutlet weak var itemTitleLabel : UILabel!
    @IBOutlet weak var itemShippingLabel : UILabel!
    @IBOutlet weak var itemProgressBar : UIProgressView!
    @IBOutlet weak var testingSlider : UISlider!
    @IBOutlet weak var proccessIcon : UIImageView!
    @IBOutlet weak var shippingIcon : UIImageView!
    @IBOutlet weak var recievingIcon : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PurchasedService.purchasedService.run()
        
        // Do any additional setup after loading the view.
        itemTable.register(PurchasedItemsTableViewCell.nib(), forCellReuseIdentifier: PurchasedItemsTableViewCell.identefier)
        
        itemTable.delegate = self
        itemTable.dataSource = self
    }
    
    func progressBarIcons(){
        if(itemProgressBar.progress > 0){
            proccessIcon.image = UIImage(systemName: "dot.circle.fill")
            if(itemProgressBar.progress >= 0.5){
                shippingIcon.image = UIImage(systemName: "dot.circle.fill")
                if(itemProgressBar.progress >= 1){
                    recievingIcon.image = UIImage(systemName: "dot.circle.fill")
                }else{
                    recievingIcon.image = UIImage(systemName: "dot.circle")
                }
            }else{
                shippingIcon.image = UIImage(systemName: "dot.circle")
                recievingIcon.image = UIImage(systemName: "dot.circle")
            }
        }else{
            proccessIcon.image = UIImage(systemName: "dot.circle")
            shippingIcon.image = UIImage(systemName: "dot.circle")
            recievingIcon.image = UIImage(systemName: "dot.circle")
        }
    }
    
}

extension PurchasedViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = PurchasedService.purchasedService.purchasedItems[indexPath.row]
        
        itemTitleLabel.text = "Name: " + item.name
        itemShippingLabel.text = "Shipping Style: " + item.shippingInfo
        
        itemProgressBar.progress = testingSlider.value
        progressBarIcons()
        
        if(itemProgressBar.progress == 1){
        DBHelperUser.dbHelperUser.finishShipping(username: CurrentUser.currentUser.name!, productID: item.productID)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

extension PurchasedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PurchasedService.purchasedService.purchasedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchasedItemsTableViewCell.identefier, for: indexPath) as! PurchasedItemsTableViewCell
        let item = PurchasedService.purchasedService.purchasedItems[indexPath.row]
        var image = UIImage()
        
        if(item.image != nil){
            image = UIImage(named: item.image!)!
        }else{
            image = UIImage(data: item.imageData!)!
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        cell.configure(title: item.name, price: item.price, date: dateFormatter.string(from: item.date), icon: image)
        return cell
    }
}
