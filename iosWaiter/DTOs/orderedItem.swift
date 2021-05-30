//
//  orderedItem.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 19..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import UIKit
import Foundation
import FirebaseFirestore

class OrderedItem{
    var name: String?
    var type: String?
    var set: String?
    var withExtra: Bool?
    var price: Int?
    var deliveryTime: Int?
    var instruction: String?
    
    
    var amount: String?
    var payWithCash: Bool?
    var payWithCredit: Bool?
    
    init(){
        name = "default"
        type = "default"
        set = "default"
        withExtra = true
        price = 123
        deliveryTime = 123
        instruction = "default"
        amount = "default"
        payWithCash = false
        payWithCredit = true
    }
    
    init(n: String, t: String, se: String, w: Bool, p: Int, d:Int, i: String, a: String){
         name = n
         type = t
         set = se
         withExtra = w
         price = p
         deliveryTime = d
         instruction = i
        amount = a
    }
    
    public static func getData() -> Array<OrderedItem>{
        
        var retVal: [OrderedItem] = []
        
        //let ref = Firestore.firestore().collection("Order")
        let ref = Firestore.firestore().collection("Order")
        ref.getDocuments{(snapshot, error) in
            if let err = error{
                print("Unexpected error occured!", err)
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents{
                    let data = document.data()
                    let oname = data["order_name"] as? String ?? "Hamburger"
                    let otype = data["order_type"] as? String ?? "DEFAULT"
                    let oset = data["order_set"] as? String ?? "DEFAULT"
                    let owith = data["order_withExtra"] as? Bool ?? true
                    let otime = data["order_deliveryTime"] as? Int ?? 0
                    let oinst = data["order_instruction"] as? String ?? "DEFAULT"
                    let oprice = data["order_price"] as? Int ?? 0
                    let oamount = data["order_amount"] as? String ?? "DEFAULT"
                    
                    
                    var p = OrderedItem(n: oname, t: otype, se: oset, w: owith, p: oprice, d:otime, i: oinst, a: oamount)
                    
                    retVal.append(p)
                    //historyController.data.append(p)
                    //historyController.dataSor.append(p)
                    historyController.dataSou.append(p)
                }
            }
        }
        //historyController.data = retVal
        return retVal
    }
    
}
