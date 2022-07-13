//
//  ProductViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/7/22.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var sellerLable: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func addToCart(_ sender : Any){
        DBHelperUser.dbHelperUser.addWishlist(username: CurrentUser.currentUser.name!, productID: currentID)
    }
    
    @IBAction func addToWish(_ sender : Any){
        DBHelperUser.dbHelperUser.addCartItem(username: CurrentUser.currentUser.name!, productID: currentID)
    }
    
    
    
    
    var timer = Timer()
    var currentID = String()
    var updateAvailable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.numberOfLines = 0
        titleLabel.numberOfLines = 3

        // Do any additional setup after loading the view.
        productCollectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        ProductService.productService.setID(currentID)
        ProductService.productService.createProduct()
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
    
    func viewData(){
        print(ProductService.productService.productViewModel.title)
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
        if(updateAvailable){
            viewData()
            timer.invalidate()
        }
        ProductService.productService.updateProduct = {
            () in
            self.updateAvailable = true
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
