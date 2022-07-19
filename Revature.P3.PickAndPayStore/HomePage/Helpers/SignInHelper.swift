//
//  SignInHelper.swift
//  Revature.P3.PickAndPayStore
//
//  Created by admin on 7/19/22.
//

import Foundation
import UIKit

class SignInHelper{
    static var helper = SignInHelper()
    var isUserSignedIn = false
    
    private init(){
        
    }
    
    func setWelcomeText() -> (labelText: String, buttonText: String){
        isUserSignedIn = checkUserSignedIn()
        var labelText = ""
        var buttonTitle = ""
        if isUserSignedIn{
            if CurrentUser.currentUser.name != nil{
                labelText = CurrentUser.currentUser.name!
            }
            buttonTitle =  "Sign Out"
        }
        else{
            labelText = "Sign in or create an account"
            buttonTitle = "Sign In/Sign Up"
        }
        return (labelText, buttonTitle)
    }
    
    func checkUserSignedIn() -> Bool{
        if CurrentUser.currentUser.name != "Guest"{
            return true
        }
        else{
            return  false
        }
    }
}
