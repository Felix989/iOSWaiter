//
//  AsianController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 02..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit

class AsianController: UIViewController {
    var orderInfo = GeneralOrderInfo()
    var tipBoolean = false
    public static var price_placeholder = 123
    var isSpicy =  false
    
    @IBOutlet weak var amountIndicator: UILabel!
    
    @IBAction func amountStepper(_ sender: UIStepper) {
        amountIndicator.text = String(sender.value)
    }
    
    @IBAction func typeChooser(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        ViewController.order.type = sender.titleForSegment(at: index)!
    }
    
    
    @IBAction func sizeChooser(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        ViewController.order.set = sender.titleForSegment(at: index)!
    }
    
    @IBOutlet weak var spiceCHooser: UISwitch!
    

    
    @IBAction func order(_ sender: UIButton) {
        ViewController.order.amount = amountIndicator.text!
        ViewController.order.name = "Ramen"
        if(ViewController.order.set == "Small"){
            ViewController.order.price = 990
        } else if(ViewController.order.set == "Medium"){
            ViewController.order.price = 1100
        } else if(ViewController.order.set == "Large"){
            ViewController.order.price = 1550
        }
        
        if(spiceCHooser.isOn){
            tipBoolean = true
        } else {
            tipBoolean = false
        }
        //ez a kettő lehetne akár egy method is...
        if(tipBoolean){
            ViewController.order.price = ViewController.order.price! + 350
            AsianController.price_placeholder =
                AsianController.price_placeholder + 350
        }
        //instruction placeholder
        //ViewController.order.instruction = leaveInst.text!
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.order.price = 990
        ViewController.order.set = "Small"
        ViewController.order.name = "Ramen"
        ViewController.order.type = "Meat"
        ViewController.order.withExtra = false
        ViewController.order.instruction = "none"
        ViewController.order.deliveryTime = 23
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
