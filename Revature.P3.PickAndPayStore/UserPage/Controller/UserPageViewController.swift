//
//  UserPageViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/19/22.
//

import UIKit
import SwiftUI

class UserPageViewContoller: UIViewController {
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setWelcomeText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setWelcomeText()
    }
    
    func setWelcomeText(){
        let currentText = SignInHelper.helper.setWelcomeText()
        welcomeText.text = currentText.labelText
        signInButton.setTitle(currentText.buttonText, for: .normal)
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
        let wishListHostingController = UIHostingController(rootView: WishListSwiftUIView())
        self.navigationController?.pushViewController(wishListHostingController, animated: true)
    }
    
    @IBAction func SignInUp(_ sender: Any) {
        if !SignInHelper.helper.isUserSignedIn{
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

