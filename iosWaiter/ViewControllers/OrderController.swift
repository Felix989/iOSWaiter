//
//  OrderController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 19..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import UIKit

class OrderController: UIViewController{
    
    
    
    static var person = Person()
    //let db = Database.database().reference()
    //let number = Int(arc4random_uniform(9999999) + 1)

    
    @IBOutlet weak var priceIndicator: UILabel!
    @IBOutlet weak var getName: UITextField!
    @IBOutlet weak var getStreet: UITextField!
    @IBOutlet weak var getHouse: UITextField!
    @IBOutlet weak var getPhone: UITextField!
    
    
    @IBOutlet weak var times: UILabel!
    
    
    
    
    @IBAction func orderButton(_ sender: UIButton) {
        OrderController.person.name = getName.text
        OrderController.person.street = getStreet.text
        OrderController.person.house = getHouse.text
        OrderController.person.phone = getPhone.text
        if(OrderController.person.name != "" &&
            OrderController.person.street != "" &&
            OrderController.person.house != "" &&
            OrderController.person.phone != ""){
            self.performSegue(withIdentifier: "cardDetails", sender: self)
            
            
            //Person.writeData(person: OrderController.person)
           /*
            let db = Firestore.firestore().document("Order")
            let number = Int(arc4random_uniform(9999999) + 1)
            db.setData([String(number): OrderController.person])
             */
            
/*var ref: DatabaseReference!
            
            
                    ref = Database.database().reference()
                    ref.child("Order").setValue(OrderController.person)
            */
            
            
            
        //db.child(String(number)).setValue(OrderController.person)
            
        } else {
            priceIndicator.text = "Every input has to be filled!"
        }
    }
    
    
    
    
    
    
    @IBAction func useSavedOptions(_ sender: UIButton) {
        getName.text = SettingsController.settings.name
        getStreet.text = SettingsController.settings.street
        getHouse.text = SettingsController.settings.house
        getPhone.text = SettingsController.settings.phone
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FirebaseApp.configure()//initializes firebase configuration
        priceIndicator.text = String(ViewController.order.price!)
        //minutePlaceholder.text = String(ViewController.order.deliveryTime!)
        times.text = ViewController.order.amount
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   /* public func pushToServer(person: Person){
        let db = Firestore.firestore().document("Order")
        let number = Int(arc4random_uniform(9999999) + 1)
        db.setData([String(number): person])
    }*/
    
    
    
}
