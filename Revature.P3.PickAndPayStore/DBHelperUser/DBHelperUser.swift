//
//  DBHelperUser.swift
//  Revature.P3.PickAndPayStore
//
//  Created by Maximilian Stump on 7/8/22.
//

import Foundation
import UIKit
import CoreData

class DBHelperUser {
    
    static var dbHelperUser = DBHelperUser() //accessible without a DBHelper instance
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

    func isUserRegistered(username : String) -> Bool { //get one user with name
        var isUserCreated = false
        var user = User()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        fetchRequest.fetchLimit = 1 //to fetch only the first item with the parameter "username"
        do {
            let request = try context?.fetch(fetchRequest) as! [User]
            if request.count != 0 {
                isUserCreated = true
                user = request.first as! User
            } else {
                isUserCreated = false
                print("Error: No user found.")
            }
        } catch {
            print("Error.")
        }
        return isUserCreated
    }
    
    //CRUD operations - Creation
    func createUser(nameValue : String, emailValue: String, passwordValue: String, reEnterPasswordValue: String, mobileValue: String) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.username = nameValue
        user.email = emailValue
        user.password = passwordValue
//        user.repassword = reEnterPasswordValue
        user.phoneNumber = mobileValue
        do {
            try context?.save()
            print("User data saved.")
        } catch {
            print("Error: Data not saved.")
        }
    }
    
    //function to get User for password validation
    func getOne(username : String) -> User { //get one user with name
        var user = User()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        fetchRequest.fetchLimit = 1 //to fetch only the first item with the parameter "username"
        do {
            let request = try context?.fetch(fetchRequest) as! [User]
            if request.count != 0 {
                user = request.first as! User
            } else {
                print("Error: No user found.")
                return user
            }
        } catch {
            print("Error.")
        }
        return user
    }
}
