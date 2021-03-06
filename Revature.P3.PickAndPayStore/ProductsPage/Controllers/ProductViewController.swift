//
//  ProductViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import UIKit
import SwiftUI

class ProductViewController: UIViewController {

    @IBOutlet weak var loadingIcon: UIActivityIndicatorView!
    @IBOutlet weak var sellerLable: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    @IBOutlet weak var displayError : UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func addToCart(_ sender : Any){
        if CurrentUser.currentUser.name != nil{
            storeData()
            DBHelperUser.dbHelperUser.addCartItem(username: CurrentUser.currentUser.name!, productID: currentID)
            self.tabBarController?.selectedIndex = 1
        }
    }
    
    @IBAction func addToWish(_ sender : Any){
        if CurrentUser.currentUser.name != nil{
            DBHelperUser.dbHelperUser.addWishlist(username: CurrentUser.currentUser.name!, productID: currentID)
            storeData()
            
            //self.tabBarController?.selectedIndex = 2
        }
    }
    
    
    
    
    var timer = Timer()
    var currentID = String()
    var currentPrice = String()
    var updateAvailable = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingIcon.startAnimating()
        descriptionLabel.numberOfLines = 0
        titleLabel.numberOfLines = 3

        // Do any additional setup after loading the view.
        productCollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        ProductService.productService.setID(currentID)
        ProductService.productService.createProduct(currentPrice)
        viewData()
        
        let date = Date.now.addingTimeInterval(0.2)
        timer = Timer(fireAt: date, interval: 0, target: self, selector: #selector(updateImages), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        productCollectionView.collectionViewLayout = layout
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
    func storeData(){
        let product = ProductService.productService.productViewModel
        var isStored = false
        for i in DBHelperProductApi.dBHelperProductApi.getProductApiList(username: CurrentUser.currentUser.name!){
            if(i.productId == currentID){
                isStored = true
                break
            }
        }
        if(!isStored){
            DBHelperProductApi.dBHelperProductApi.addProductApiItem(username: CurrentUser.currentUser.name!, productID: currentID, title: product.title, rating: product.rating, price: product.price, image: product.imageData)
        }
    }
    
    func viewData(){
        if(currentID.contains("local-")){
            loadingIcon.stopAnimating()
        }
        productCollectionView.reloadData()
        mainImage.image = ProductService.productService.productViewModel.mainImage
        sellerLable.text = ProductService.productService.productViewModel.seller
        titleLabel.text = ProductService.productService.productViewModel.title
        priceLabel.text = "Price: " + ProductService.productService.productViewModel.price
        ratingLabel.text = "Rating: " + ProductService.productService.productViewModel.rating
        descriptionLabel.text = ProductService.productService.productViewModel.description
        print(ProductService.productService.productViewModel.images.count)
    }
    
    @objc func updateImages(){
        if(updateAvailable == 1){
            viewData()
            loadingIcon.stopAnimating()
            timer.invalidate()
        }else if(updateAvailable == 2){
            self.loadingIcon.stopAnimating()
            self.displayError.isHidden = false
            timer.invalidate()
        }
        ProductService.productService.updateProduct = {
            () in
            self.updateAvailable = 1
        }
        ProductService.productService.manageErrors = {
            () in
            self.updateAvailable = 2
        }
    }
}


//Collection View
extension ProductViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension ProductViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 200, height: 200)
    }
}

extension ProductViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  ProductService.productService.productViewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        cell.displayImage.image = ProductService.productService.productViewModel.images[indexPath.row]
        
        return cell
    }
}
