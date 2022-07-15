//
//  ViewController.swift
//  WishList
//
//  Created by Mihir Ghosh on 7/1/22.
//

import UIKit
import SwiftUI

class SecondTab: UIViewController {

    var userChoices = [
        SecondTabChoices(choices: "Check Order", symbols: "checkorder"),
        SecondTabChoices(choices: "History", symbols: "history"),
        SecondTabChoices(choices: "Wish List", symbols: "wishlist")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInSignUpButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let signInAndUp = storyBoard.instantiateViewController(withIdentifier: "SignIn") as! LoginViewController
        self.navigationController?.pushViewController(signInAndUp, animated: true)
    }
    

}
extension SecondTab: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userChoices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = UIColor.clear
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.systemGreen.cgColor,
            UIColor.white.cgColor
        ]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondTabCell
        cell.selection.text = userChoices[indexPath.row].choices
        cell.listIcon.image = UIImage(named: userChoices[indexPath.row].symbols)
        
        
        cell.backgroundColor = UIColor.clear
        cell.listIcon.layer.cornerRadius = 10
        //cell.layer.cornerRadius = cell.listIcon.frame.height / 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let wishList = storyBoard.instantiateViewController(withIdentifier: "wishPage") as! WishTableVC
//        let history = storyBoard.instantiateViewController(withIdentifier: "historyPage") // as! HistoryTableVC
        
        let vc0 = UIHostingController(rootView: CheckOrderSwiftUI())
        let vc1 = UIHostingController(rootView: HistoryView())
        let vc2 = UIHostingController(rootView: WishContentView())
        
        switch(indexPath.row){
        case 0:
            self.navigationController?.pushViewController(vc0, animated: true)
        case 1:
            self.navigationController?.pushViewController(vc1, animated: true)
        case 2:
            self.navigationController?.pushViewController(vc2, animated: true)
        default:
            print("Nothing selected")
        }
        
    }

}

