//
//  DatabaseController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 23..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
//import Firebase
import FirebaseFirestore


class DatabaseController: UIViewController{
    let database = Firestore.firestore()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let ref = database.document("Order")
        ref.getDocument{snapshot, error in
            guard let _ = snapshot?.data(), error == nil else {
                return
            }
        }
    }
    
    func writeData(person: Person){
        let ref = database.document("Order")
        let number = Int(arc4random_uniform(9999999) + 1)
        ref.setData([String(number): person])
    }
    
}








/*
public class DatabaseController: UIViewController{
    public let db = Firestore.firestore().document("Order")
    public let number = Int(arc4random_uniform(9999999) + 1)
    
    func pushToServer(person: Person){
        db.setData([String(number): person])
    }
}
*/
