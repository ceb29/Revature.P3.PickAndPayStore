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
    @IBOutlet weak var searchTable: UITableView!
    var isUserSignedIn = false
    var searchResults : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setWelcomeText()
        HomeCollectionHelper.helper.updateRecommendedData(isUserSignedIn: isUserSignedIn)
        recommendedCollectionView.reloadData()
    }
    
    func setupViews(){
        HomeCollectionHelper.helper.updateRecommendedData(isUserSignedIn: isUserSignedIn)
        ProductHelper.productHelper.createGuestUser()
        bottomPromoImage.image = UIImage(named: "appleAdvertisement")
    }
    
    func setWelcomeText(){
        if CurrentUser.currentUser.name != "Guest"{
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
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            return HomeCollectionHelper.helper.productData.count
        case "homePromos":
            promoPageControl.numberOfPages = HomeCollectionHelper.helper.promoData.count
            return HomeCollectionHelper.helper.promoData.count //need to change to promodata
        default:
            return HomeCollectionHelper.helper.recommendedData.count //need to change to recommended data
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeProductCell", for: indexPath) as! HomeProductCollectionViewCell
            return HomeCollectionHelper.helper.setupHomeProductCollectionCell(currentCell, indexPath)
        case "homePromos":
            let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homePromoCell", for: indexPath) as! HomePromoCollectionViewCell
            return HomeCollectionHelper.helper.setupHomePromoCollectionCell(currentCell, indexPath)
        default:
            let currentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeRecommendedCell", for: indexPath) as! HomeRecommendedCollectionViewCell
            return HomeCollectionHelper.helper.setupHomeRecommendedCollectionCell(currentCell, indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.restorationIdentifier{
        case "homeProducts":
            let category = HomeCollectionHelper.helper.productData
            goToCategoryPage(category: category[indexPath.row].name)
        case "homePromos":
            let promo = HomeCollectionHelper.helper.promoData
            goToProductPage(productID: promo[indexPath.row].productID)
        default:
            let products = HomeCollectionHelper.helper.recommendedData
            goToProductPage(productID: products[indexPath.row].productID)
        }
    }
    
    func goToCategoryPage(category: String){
        let storyObject = UIStoryboard(name: "Products", bundle: nil)
        let categoryVC = storyObject.instantiateViewController(withIdentifier: "ProductSVC") as! ProductsViewController
        categoryVC.searchedItem = category
        self.navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if(scrollView.restorationIdentifier == "homePromos"){
            promoPageControl.currentPage = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        searchCell.searchLabel.text = ProductHelper.productHelper.getProductByID(productID: searchResults[indexPath.row]).name
        return searchCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToProductPage(productID: searchResults[indexPath.row])
    }
    
    func goToProductPage(productID: String){
        let storyObject = UIStoryboard(name: "Products", bundle: nil)
        let productVC = storyObject.instantiateViewController(withIdentifier: "ProductVC") as! ProductViewController
        productVC.currentID = productID
        self.navigationController?.pushViewController(productVC, animated: true)
    }
}

extension HomeViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResults = []
        if searchText.isEmpty{ //if search is empty, search results table view should be hidden
            searchTable.isHidden = true
        }
        else{ //filter data using search text and store in search results
            searchTable.isHidden = false
            searchResults = HomeSearchHelper.helper.searchWithPartial(searchText: searchText)
        }
        searchTable.reloadData()
    }
}
