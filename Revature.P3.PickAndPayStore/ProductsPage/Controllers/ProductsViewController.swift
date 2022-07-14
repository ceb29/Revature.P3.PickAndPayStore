//
//  ProductsViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/11/22.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var productsTable : UITableView!
    @IBOutlet weak var productSearchBar : UISearchBar!
    
    var timer = Timer()
    var isUpdateAvailable = false
    var searchedItem = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
        let date = Date.now.addingTimeInterval(0.2)
        timer = Timer(fireAt: date, interval: 0, target: self, selector: #selector(updateTable), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
        
        //activate to run search products
        //ProductService.productService.multiSearchProducts(["B0B538KW78", "B099VMT8VZ", "B07VGRJDFY", "B01CQTUIKE"])
        ProductService.productService.searchProduct(searchedItem)
        
        productsTable.register(ProductsTableViewCell.nib(), forCellReuseIdentifier: ProductsTableViewCell.identefier)
        productsTable.delegate = self
        productsTable.dataSource = self
        productSearchBar.delegate = self
    }
    
    @objc func updateTable(){
        if(isUpdateAvailable){
            isUpdateAvailable = false
            productsTable.reloadData()
            timer.invalidate()
        }
        
        ProductService.productService.updateProduct = {
            () in
            self.isUpdateAvailable = true
        }
    }
}

extension ProductsViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        ProductService.productService.searchProduct(searchBar.text!)
        
        let date = Date.now.addingTimeInterval(0.2)
        timer = Timer(fireAt: date, interval: 0, target: self, selector: #selector(updateTable), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }
}


extension ProductsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let id = ProductService.productService.searchedProducts[indexPath.row].id
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductVC") as? ProductViewController else{
            return
        }
        
        vc.currentID = id
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
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
