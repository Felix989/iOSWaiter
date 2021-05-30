//
//  Person.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 02..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import FirebaseFirestore

public class Person {
    public var name: String?
    public var street: String?
    public var house: String?
    public var phone: String?
    private var order: OrderedItem?
    

    /*
    init (n: String, s: String, h: String, p: String){
        self.name = n
        self.street = s
        self.house = h
        self.phone = p
    }*/
    
    
    init(){
        self.name = "default"
        self.street = "default"
        self.house = "default"
        self.phone = "default"
        self.order = ViewController.order
    }
    
    init(uname: String, uhouse: String, ustreet: String, uphone: String){
        self.name = uname
        self.street = ustreet
        self.house = uhouse
        self.phone = uphone
        self.order = ViewController.order
    }
    
    public static func testData(person: Person){
        let db = Firestore.firestore()
        //let ref = db.document("Order")
        let number = Int(arc4random_uniform(9999999) + 1)
        db.collection("Order").document(String(number)).setData([
            "name": person.name!,
            "house": person.house!,
            "street": person.street!,
            "phone": person.phone!,
            "order_name": ViewController.order.name!,
            "order_type":ViewController.order.type!,
            "order_set": ViewController.order.set!,
            "order_withExtra": ViewController.order.withExtra!,
            "order_price": ViewController.order.price!,
            "order_deliveryTime": ViewController.order.deliveryTime!,
            "order_instruction": ViewController.order.instruction!,
            "order_amount": ViewController.order.amount!
            ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
   /* public static func getData() -> Array<Person>{
        
        var retVal: [Person] = []
        
        let ref = Firestore.firestore().collection("Order")
        ref.getDocuments{(snapshot, error) in
            if let err = error{
                print("Unexpected error occured!", err)
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents{
                    let data = document.data()
                    let uname = data["name"] as? String ?? "DEFAULT"
                    let uhouse = data["house"] as? String ?? "DEFAULT"
                    let ustreet = data["street"] as? String ?? "DEFAULT"
                    let uphone = data["phone"] as? String ?? "DEFAULT"
                    
                    print(uname, uhouse, ustreet, uphone)
                    
                    var p = Person(uname: uname, uhouse: uhouse, ustreet: ustreet, uphone: uphone)
                    retVal.append(p)
                    //historyController.data.append(p)
                    //historyController.dataSor.append(p)
                    //historyController.dataSou.append(p)
                }
            }
        }
        //historyController.data = retVal
        return retVal
    }*/
    
    public static func writeData(person: Person){
        let db = Firestore.firestore()
        let ref = db.document("Order")
        let number = Int(arc4random_uniform(9999999) + 1)
        ref.setData([String(number): person])
    }
}
