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


