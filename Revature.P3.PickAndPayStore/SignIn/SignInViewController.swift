//
//  SignInViewController.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Maximilian Stump on 7/5/22.
//

import UIKit
import CoreData

class SignInViewController: UIViewController {

    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var enterNameTextField: UITextField!
    @IBOutlet weak var enterEmailTextField: UITextField!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var ReEnterPasswordTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var SignIn: UIButton!
    
    // Various variables for usage
    
    var pin = 1234
    var errorMsg = ""
    let userDef = UserDefaults.standard
    let switchStatus = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // This action function calls to the signUp() function
    // Sends a push notification after clicking the getOTP button
    
    @IBAction func getOTP(_ sender: Any) {
        
        if getOTPSignUp() == true {
            
            errorMessage.text = ""
        
        let dialogMessage = UIAlertController(title: "Alert", message: "Your code is \(pin)", preferredStyle: .alert)
                
                // Create Confirm button with action handler
                let confirm = UIAlertAction(title: "Confirm", style: .default, handler: { (action) -> Void in
                    print("Confirm button tapped")
                    self.displaySecondPush()
                })
                
                // Create Cancel button with action handlder
                let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                    print("Cancel button tapped")
                }
                
                // Add Confrim and Cancel button to dialog message
                dialogMessage.addAction(confirm)
                dialogMessage.addAction(cancel)
                
                // Present dialog message to user
                self.present(dialogMessage, animated: true, completion: nil)
            }
    }
    
    
    // This function displays after confirming the first push notification
    // This checks that the pin is correct before allowing the sign up button to appear
    
    func displaySecondPush() {
        let dialogMessage = UIAlertController(title: "Confirm", message: "Please Enter your code", preferredStyle: .alert)
        
        // Add a text field
        dialogMessage.addTextField(configurationHandler: { textField in
            textField.placeholder = "Type in your PIN"
        })
                
                // Create Confirm button with action handler
                let confirm = UIAlertAction(title: "Confirm", style: .default, handler: { (action) -> Void in
                    print("Confirm button tapped")
                    var inputText = dialogMessage.textFields![0].text
                    //print(dialogMessage.textFields![0].text)
                    
                    if inputText == String(self.pin) {
                        print("good job")
                        self.SignIn.isHidden = false
                }
                    
                    else {
                        print("bad job")
                    }
                    
               })
                
                // Create Cancel button with action handlder
                let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                    print("Cancel button tapped")
                }
                
                //Add Confirm and Cancel button to dialog message
                dialogMessage.addAction(confirm)
                dialogMessage.addAction(cancel)
                
                // Present dialog message to user
                self.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    // This action function is for the sign in button, which calls to the signUp() function
    
    @IBAction func signInAppear(_ sender: Any) {
        signUp()
            
    }
    
    
    // This function checks all the text fields to see if they have been filled out
    // THIS IS THE FIRST CHECK FOR CREDENTIALS
   
    func didRegisterAccountValidation(input: String?) -> Bool {
        var validInput = false
        if input != nil && input != "" && !input!.isEmpty {
            validInput = true
        }
        return validInput
    }
    
    
    // This function checks to see if the username/email belongs to a new user
    // If new user, create new user :)
    
    func didRegisterAccountNewUser(username: String) -> Bool {
        let newUser = !DBHelperUser.dbHelperUser.isUserRegistered(username: username)
        return newUser
    }
    
    
    // This function uses regex to check if the user is following correct inputs
    // Also calls various different functions

    func regexCredentials(username: String, password: String, repassword: String) -> Bool {
        var validation = false
        if !validUsername(username: username) {
            self.errorMessage.text = "Enter a valid email."
            print("first")
        }
        else if !passwordLength(password: password) {
                self.errorMessage.text = "Enter a password with at least 8 characters"
                print("second")
            }
            else if !passwordStrength(password: password) {
                    //self.errorMessage.text = "Need 1 uppercase, 1 lowercase, 1 number, 1 special character."
                    print("third")
                }
                else if !passwordMatch(password: password, repassword: repassword) {
                        self.errorMessage.text = "Passwords do not match."
                        print("fourth")
                    }
                    else {
                        validation = true
                        print("nice")
                    }
        return validation
    }
    
    
    // This function checks if the email follows correct credentials (ex: abc@123.com)
    
    func validUsername(username: String) -> Bool {
        let usernamePatternRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return regexValidation(value: username, regex: usernamePatternRegex)
    }
    
    
    // This function checks if the password is greater than or equal to 8 characters
    
    func passwordLength(password: String) -> Bool {
        var longPassword = false
        if password.count >= 8 {
            longPassword = true
        }
        return longPassword
    }
    
    
    // This function checks if the password has 1 uppercase, 1 lowercase, 1 number, and 1 special character
    
    func passwordStrength(password: String) -> Bool {
        var strPassword = false
        
        let capitalPassword = regexValidation(value: password, regex: ".*[A-Z]+.*")
        let lowerPassword = regexValidation(value: password, regex: ".*[a-z]+.*")
        let numberPassword = regexValidation(value: password, regex: ".*[0-9]+.*")
        let specialPassword = regexValidation(value: password, regex: ".*[!@#$&]+.*")
        
        if capitalPassword && lowerPassword && numberPassword && specialPassword  {
            strPassword = true
        }
        else {
            self.errorMessage.text = "Need 1 uppercase, lowercase, number, special character."
        }
        return strPassword
    }
    
    
    // This function checks if the password and the Re-EnterPassword are the same
    
    func passwordMatch(password: String, repassword: String) -> Bool {
     return password == repassword
    }
    
    
    // This function validates our regex by filtering through it to find potential errors
    
    func regexValidation(value: String, regex: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: value)
    }

    
    func getOTPSignUp() -> Bool {
        let name = enterNameTextField.text!
        let username = enterEmailTextField.text!
        let password = enterPasswordTextField.text!
        let reEnterPassword = ReEnterPasswordTextField.text!
        let mobile = mobileNumberTextField.text!
    
    if !(didRegisterAccountValidation(input: name) && didRegisterAccountValidation(input: username) && didRegisterAccountValidation(input: password) && didRegisterAccountValidation(input: reEnterPassword) && didRegisterAccountValidation(input: mobile)) {
        self.errorMessage.text = "Please input credentials."
        return false
    }
        else if !regexCredentials(username: username, password: password, repassword: reEnterPassword) {
               // self.errorMessage.text = "HELP"
            return false
        }
        else {
            return true
        }
}
    
    
    // This function checks CoreData for our user, seeing if they have registered yet, or if they register for the first time
    // If the user doesn't input enough credentials, give error message "Please input Credentials"
    
    func signUp() -> Bool {
        let name = enterNameTextField.text!
        let username = enterEmailTextField.text!
        let password = enterPasswordTextField.text!
        let reEnterPassword = ReEnterPasswordTextField.text!
        let mobile = mobileNumberTextField.text!
    
    if !(didRegisterAccountValidation(input: name) && didRegisterAccountValidation(input: username) && didRegisterAccountValidation(input: password) && didRegisterAccountValidation(input: reEnterPassword) && didRegisterAccountValidation(input: mobile)) {
        self.errorMessage.text = "Please input credentials."
        return false
        
    } else if !regexCredentials(username: username, password: password, repassword: reEnterPassword) {
           // self.errorMessage.text = "HELP"
        return false
        }
    
        else if DBHelperUser.dbHelperUser.isUserRegistered(username: username) {
                self.errorMessage.text = "You registered already, go to log in page."
            return false
            
            } else {
                DBHelperUser.dbHelperUser.createUser(nameValue: name, emailValue: username, passwordValue: password, reEnterPasswordValue: reEnterPassword, mobileValue: mobile)
                self.errorMessage.text = "Registered succesfully! Please log in."
                return true
            }
    }
    
}
