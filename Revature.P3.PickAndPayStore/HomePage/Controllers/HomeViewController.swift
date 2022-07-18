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
        isUserSignedIn = checkUserSignedIn()
        if isUserSignedIn{
            setWelcomeTextToSignOut()
        }
        else{
            setWelcomeTextToSignIn()
        }
    }
    
    func checkUserSignedIn() -> Bool{
        if CurrentUser.currentUser.name != "Guest"{
            return true
        }
        else{
            return  false
        }
    }
    
    func setWelcomeTextToSignOut(){
        welcomeText.text = CurrentUser.currentUser.name
        welcomeButton.setTitle("Sign Out", for: .normal)
    }
    
    func setWelcomeTextToSignIn(){
        welcomeText.text = "Sign in or create an account"
        welcomeButton.setTitle("Sign In/Sign Up", for: .normal)
    }
    
    @IBAction func goToLoginPage(_ sender: Any) {
        if !isUserSignedIn{
            let storyObject = UIStoryboard(name: "LoginStoryboard", bundle: nil)
            let loginVC = storyObject.instantiateViewController(withIdentifier: "SignIn") as! LoginViewController
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
        else{
            CurrentUser.currentUser.name = "Guest"
            setWelcomeText()
        }
    }
}


