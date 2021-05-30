//
//  BurgerController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 02..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit

class BurgerController: UIViewController {
    
    var orderInfo = GeneralOrderInfo()
    var tipBoolean = false
    public static var price_placeholder = 123
    

    @IBAction func getType(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        ViewController.order.type = sender.titleForSegment(at: index)!
    }
    
    
    
    @IBAction func getSet(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        ViewController.order.set = sender.titleForSegment(at: index)!
    }

    @IBOutlet weak var hasFries: UISwitch!
    @IBOutlet weak var amountIndicator: UILabel!
    @IBAction func amountStepper(_ sender: UIStepper) {
        amountIndicator.text = String(sender.value)
    }
    
    @IBAction func puToBasket(_ sender: UIButton) {
        ViewController.order.amount = amountIndicator.text!
        ViewController.order.name = "Hamburger"
        if(ViewController.order.set == "Cheese"){
            ViewController.order.price = 550
        } else if(ViewController.order.set == "Beef"){
            ViewController.order.price = 730
        } else if(ViewController.order.set == "Fish"){
            ViewController.order.price = 1130
        } else if(ViewController.order.set == "Chicken"){
            ViewController.order.price = 670
        } else {
            ViewController.order.set = "Cheese"
            ViewController.order.price = 550
            ViewController.order.type = "Meat"
        }
        
        if(hasFries.isOn){
            tipBoolean = true
        } else {
            tipBoolean = false
        }
        //ez a kettő lehetne akár egy method is...
        
       if(tipBoolean){
        ViewController.order.price = ViewController.order.price! + 350
            BurgerController.price_placeholder =
                BurgerController.price_placeholder + 350
        }
        //instruction placeholder
        //ViewController.order.instruction = leaveInst.text!
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ViewController.order.price = 550
        //ViewController.order.set = "Cheese"
        //ViewController.order.name = "Hamburger"
        //ViewController.order.type = "Meat"
        //ViewController.order.withExtra = false
        //ViewController.order.instruction = "none"
        //ViewController.order.deliveryTime = 33
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
