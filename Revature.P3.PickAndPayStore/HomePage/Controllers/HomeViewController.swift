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
    @IBOutlet weak var locationPickerView: UIPickerView!
    @IBOutlet weak var welcomeButton: UIButton!
    @IBOutlet weak var searchTable: UITableView!
    var isUserSignedIn = false
    var searchResults : [String] = []
    var searchResultsID : [String] = []
    @IBOutlet weak var selectionView: UIView!
    let products = HomeRecommendedService.sharedInstance.getData()
    var pickerData = ["All Locations", "Los Angelos, CA", "New York, NY", "Houston, TX"]
    var locationPickerViewSelection = "All Locations"
    
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
        welcomeView.layer.cornerRadius = 10
        welcomeView.layer.masksToBounds = true
        selectionView.layer.cornerRadius = 10
        selectionView.layer.masksToBounds = true
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
    
    @IBAction func openSelectionView(_ sender: Any) {
        selectionView.isHidden = false
    }
    
    @IBAction func closeSelectionView(_ sender: Any) {
        selectionView.isHidden = true
    }
    
    @IBAction func printProductData(_ sender: Any) {
        //this button is for testing
        if isUserSignedIn{
            let storyObject = UIStoryboard(name: "PaymentStoryboardHost", bundle: nil)
            let shippingVC = storyObject.instantiateViewController(withIdentifier: "ShippingVC")
            self.navigationController?.pushViewController(shippingVC, animated: true)
        }
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

extension HomeViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationPickerViewSelection = pickerData[row]
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(searchResults.count)
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
    
}

extension HomeViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //
        //
        //need to change this to product service
        //
        //
        searchResults = []
        searchResultsID = []
        var currentMax = 0
        var searchDict : [String : Int] = [:]
        var currentString = ""
        if searchText.isEmpty{ //if search is empty, search results table view should be hidden
            //searchBarTableView.isHidden = true
            searchResults = []
            searchResultsID = []
            searchTable.isHidden = true
        }
        else{ //filter data using search text and store in search results
            //searchBarTableView.isHidden = false
            searchTable.isHidden = false
            for char in searchText{
                currentString += String(char)
                for i in 0..<products.count{
                    if products[i].name.lowercased().contains(currentString.lowercased()){
                        if searchDict[products[i].productID] != nil{
                            searchDict[products[i].productID] = searchDict[products[i].productID]! + 1
                        }
                        else{
                            searchDict[products[i].productID] = 1
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
            
            //print(searchDict)
            //print(searchResults)
            /*for product in products{
                if product.name.lowercased().contains(searchText.lowercased()){
                    searchResults.append(product.name)
                }
            }
            print(searchResults)*/
        }
        //searchBarTableView.reloadData() //reload collection view to show updated result
        searchTable.reloadData()
    }
    
}
