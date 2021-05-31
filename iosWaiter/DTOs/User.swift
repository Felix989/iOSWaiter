//
//  User.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 26..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import FirebaseFirestore

class User {
    public var name: String?
    public var password: String?
    public var canLogIn: Bool?
    
    init(n: String, p: String){
        name = n
        password = p
        canLogIn = false
    }
    
    
    public static func saveUser(user: User){
        let db = Firestore.firestore()
        //let ref = db.document("Order")
        let number = Int(arc4random_uniform(9999999) + 1)
        db.collection("Users").document(String(number)).setData([
            "name": user.name!,
            "password": user.password!
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
    public static func logInUser(user: User) -> Bool {
        var canLogIn: Bool = false
        let ref = Firestore.firestore().collection("Users")
        ref.getDocuments{(snapshot, error) in
            if let err = error{
                print("Unexpected error occured!", err)
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents{
                    let data = document.data()
                    let nickname = data["name"] as? String ?? "DEFAULT"
                    let pw = data["password"] as? String ?? "DEFAULT"
                        if(user.name == nickname && user.password == pw){
                            user.canLogIn = true
                            canLogIn = true
                            logInController.letVar = true
                        }
                    }
                }
            }
        return canLogIn
        }
        
    }
    

