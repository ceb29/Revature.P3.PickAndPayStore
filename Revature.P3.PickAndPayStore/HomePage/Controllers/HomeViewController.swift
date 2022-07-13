//
//  HomeViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var bottomPromoImage: UIImageView!
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var promoPageControl: UIPageControl!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var welcomeButton: UIButton!
    var isUserSignedIn = false
    let products = HomeRecommendedService.homeRecommendedServiceInstance.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setWelcomeText()
    }
    
    func setupViews(){
        welcomeView.layer.cornerRadius = 10
        welcomeView.layer.masksToBounds = true
        bottomPromoImage.image = UIImage(named: "appleAdvertisement")
    }
    
    func setWelcomeText(){
        if CurrentUser.currentUser.name != nil{
            isUserSignedIn = true
        }
        if isUserSignedIn{
            welcomeText.text = CurrentUser.currentUser.name
            welcomeButton.setTitle("Change Account", for: .normal)
        }
        else{
            welcomeText.text = "Sign in or create an account"
            welcomeButton.setTitle("Sign In/Sign Up", for: .normal)
        }
    }
    
    @IBAction func goToLoginPage(_ sender: Any) {
        let storyObject = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let loginVC = storyObject.instantiateViewController(withIdentifier: "SignIn") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func printProductData(_ sender: Any) {
        //this button is for testing
        let storyObject = UIStoryboard(name: "PaymentStoryboardHost", bundle: nil)
        let shippingVC = storyObject.instantiateViewController(withIdentifier: "ShippingVC")
        self.navigationController?.pushViewController(shippingVC, animated: true)
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            return HomeCollectionHelper.homeCollectionHelper.productData.count
        case "homePromos":
            promoPageControl.numberOfPages = HomeCollectionHelper.homeCollectionHelper.promoData.count
            return HomeCollectionHelper.homeCollectionHelper.promoData.count //need to change to promodata
        default:
            return HomeCollectionHelper.homeCollectionHelper.recommendedData.count //need to change to recommended data
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeProductCell", for: indexPath) as! HomeProductCollectionViewCell
            return HomeCollectionHelper.homeCollectionHelper.setupHomeProductCollectionCell(currentCell, indexPath)
        case "homePromos":
            let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homePromoCell", for: indexPath) as! HomePromoCollectionViewCell
            return HomeCollectionHelper.homeCollectionHelper.setupHomePromoCollectionCell(currentCell, indexPath)
        default:
            let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeRecommendedCell", for: indexPath) as! HomeRecommendedCollectionViewCell
            return HomeCollectionHelper.homeCollectionHelper.setupHomeRecommendedCollectionCell(currentCell, indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            print("home product selected")
        case "homePromos":
            let promo = HomeCollectionHelper.homeCollectionHelper.promoData
            goToProductPage(productID: promo[indexPath.row].productID)
        default:
            let products = HomeCollectionHelper.homeCollectionHelper.recommendedData
            goToProductPage(productID: products[indexPath.row].productID)
        }
    }
    
    func goToProductPage(productID: String){
        let storyObject = UIStoryboard(name: "Products", bundle: nil)
        let productVC = storyObject.instantiateViewController(withIdentifier: "ProductVC") as! ProductViewController
        productVC.currentID = productID
        self.navigationController?.pushViewController(productVC, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if(scrollView.restorationIdentifier == "homePromos"){
            promoPageControl.currentPage = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        }
    }
}

extension HomeViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
        //
        //need to change this to product service
        //
        //
        var searchResults : [String] = []
        var currentMax = 0
        var searchDict : [String : Int] = [:]
        var currentString = ""
        if searchText.isEmpty{ //if search is empty, search results table view should be hidden
            //searchBarTableView.isHidden = true
            searchResults = []
            
        }
        else{ //filter data using search text and store in search results
            //searchBarTableView.isHidden = false
            for char in searchText{
                currentString += String(char)
                for i in 0..<products.count{
                    if products[i].name.lowercased().contains(currentString.lowercased()){
                        if searchDict[products[i].name] != nil{
                            searchDict[products[i].name] = searchDict[products[i].name]! + 1
                        }
                        else{
                            searchDict[products[i].name] = 1
                        }
                    }
                }
            }
            for (str, cnt) in searchDict{
                if cnt >= currentMax{
                    searchResults.insert(str, at: 0)
                    currentMax = cnt
                }
                else{
                    searchResults.append(str)
                }
            }
            print(searchDict)
            print(searchResults)
            /*for product in products{
                if product.name.lowercased().contains(searchText.lowercased()){
                    searchResults.append(product.name)
                }
            }
            print(searchResults)*/
        }
        //searchBarTableView.reloadData() //reload collection view to show updated result
    }}
