//
//  HomeViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 6/27/22.
//

import UIKit

class HomeViewController: UIViewController{
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var promoPageControl: UIPageControl!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var welcomeButton: UIButton!
    @IBOutlet weak var searchTable: UITableView!
    var searchResults : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupWelcomeView()
        HomeCollectionHelper.helper.updateRecommendedData(isUserSignedIn: SignInHelper.helper.isUserSignedIn)
        recommendedCollectionView.reloadData()
    }
    
    func setup(){
        HomeCollectionHelper.helper.updateRecommendedData(isUserSignedIn: SignInHelper.helper.isUserSignedIn)
        ProductHelper.productHelper.createGuestUser()
    }
    
    func setupWelcomeView(){
        let currentText = SignInHelper.helper.setWelcomeText()
        welcomeText.text = currentText.labelText
        welcomeButton.setTitle(currentText.buttonText, for: .normal)
    }
    
    @IBAction func goToLoginPage(_ sender: Any) {
        if !SignInHelper.helper.isUserSignedIn{
            let storyObject = UIStoryboard(name: "LoginStoryboard", bundle: nil)
            let loginVC = storyObject.instantiateViewController(withIdentifier: "SignIn") as! LoginViewController
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
        else{
            CurrentUser.currentUser.name = "Guest"
            setupWelcomeView()
        }
    }
}
