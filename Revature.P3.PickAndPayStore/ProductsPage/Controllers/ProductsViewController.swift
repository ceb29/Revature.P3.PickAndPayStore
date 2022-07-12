//
//  ProductsViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/11/22.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var productsTable : UITableView!
    
    var timer = Timer()
    var update = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let date = Date.now.addingTimeInterval(0.2)
        timer = Timer(fireAt: date, interval: 0, target: self, selector: #selector(updateTable), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
        
        //activate to run search products
        ProductService.productService.searchProduct()
        
        productsTable.register(ProductsTableViewCell.nib(), forCellReuseIdentifier: ProductsTableViewCell.identefier)
        productsTable.delegate = self
        productsTable.dataSource = self
    }
    
    @objc func updateTable(){
        if(update){
            update = false
            productsTable.reloadData()
            timer.invalidate()
        }
        
        ProductService.productService.updateProduct = {
            () in
            self.update = true
        }
    }
}

extension ProductsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProductsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductService.productService.searchedProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.identefier) as! ProductsTableViewCell
        let product = ProductService.productService.searchedProducts[indexPath.row]
        
        cell.configure(title: product.title, price: product.price, rating: product.rating, icon: product.icon)
        
        
        return cell
    }
}
