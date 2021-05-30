//
//  indexController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 30..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit
class IndexController: UIViewController{
    
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    
    /*
    name = "default"
    type = "default"
    set = "default"
    withExtra = true
    price = 123
    deliveryTime = 123
    instruction = "default"
    amount = "default"
    */

    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var type: UILabel!
    
    @IBOutlet weak var set: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var deliveryTime: UILabel!
    
    @IBOutlet weak var instruction: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var ord = OrderedItem()
        ord = historyController.dataSou[historyController.indexOfClick]
        name.text = ord.name
        type.text = ord.type
        set.text = ord.set
        price.text = String(ord.price!) + " Huf"
        deliveryTime.text = String(ord.deliveryTime!) + " minute(s)"
        instruction.text = ord.instruction
        amount.text = ord.amount! + " amount"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


