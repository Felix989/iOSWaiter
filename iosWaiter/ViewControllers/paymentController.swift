//
//  paymentController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 28..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit

class paymentController: UIViewController{
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var getCardNumber: UITextField!
    
    @IBOutlet weak var getExpirationDate: UITextField!
    @IBOutlet weak var getContactInfo: UISwitch!
    
    @IBOutlet weak var getcvc: UITextField!
    
    @IBOutlet weak var infotext: UILabel!
    
    @IBAction func order(_ sender: UIButton) {
        if(getCardNumber.text != "" &&
            getExpirationDate.text != "" &&
            getcvc.text != ""){
            self.performSegue(withIdentifier: "finishOrder", sender: self)
            
            Person.testData(person: OrderController.person)
        } else {
            infotext.text = "Missing Credit Card Info!"
        } 
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
