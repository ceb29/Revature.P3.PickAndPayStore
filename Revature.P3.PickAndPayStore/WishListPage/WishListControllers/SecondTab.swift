//
//  ViewController.swift
//  WishList
//
//  Created by Mihir Ghosh on 7/1/22.
//

import UIKit
import SwiftUI

class SecondTab: UIViewController {
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    var isUserSignedIn = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setWelcomeText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setWelcomeText()
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
        signInButton.setTitle("Sign Out", for: .normal)
    }
    
    func setWelcomeTextToSignIn(){
        welcomeText.text = "Sign in or create an account"
        signInButton.setTitle("Sign In/Sign Up", for: .normal)
    }
    
    @IBAction func goToCheckOrderStatus(_ sender: Any) {
        let checkOrderHostingController = UIHostingController(rootView: CheckOrderSwiftUI())
        self.navigationController?.pushViewController(checkOrderHostingController, animated: true)
    }
    
    @IBAction func goToOrderHistory(_ sender: Any) {
        let historyHostingController = UIHostingController(rootView: HistoryView())
        self.navigationController?.pushViewController(historyHostingController, animated: true)
    }
    
    @IBAction func goToWishList(_ sender: Any) {
        let wishListHostingController = UIHostingController(rootView: WishContentView())
        self.navigationController?.pushViewController(wishListHostingController, animated: true)
    }
    
    @IBAction func SignInUp(_ sender: Any) {
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

