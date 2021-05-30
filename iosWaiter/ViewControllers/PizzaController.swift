//
//  PizzaController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 02..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit

class PizzaController: UIViewController {
    
    var orderInfo = GeneralOrderInfo()
    var tipBoolean = false
    public static var price_placeholder = 123


    @IBOutlet weak var amountIndicator: UILabel!
    @IBOutlet weak var addTipText: UILabel!
    
    @IBAction func typeChooser(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        ViewController.order.type = sender.titleForSegment(at: index)!
        //addTipText.text  = sender.titleForSegment(at: index)
    }
    @IBAction func diameterChooser(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        ViewController.order.set = sender.titleForSegment(at: index)!
        //addTipText.text  = sender.titleForSegment(at: index)
    }
    
    @IBAction func amountStepper(_ sender: UIStepper) {
        amountIndicator.text = String(sender.value)
    }
    
    @IBOutlet weak var leaveInst: UITextField!
    
    
    @IBOutlet weak var tipChoos: UISwitch!
    
    @IBAction func getPriceEval(_ sender: UIButton) {
        
        ViewController.order.amount = amountIndicator.text!
        if(ViewController.order.set == "35cm"){
            ViewController.order.price = 780
        } else if(ViewController.order.set == "50cm"){
            ViewController.order.price = 990
        } else if(ViewController.order.set == "75cm"){
            ViewController.order.price = 1250
        }
        
        if(tipChoos.isOn){
            tipBoolean = true
        } else {
            tipBoolean = false
        }
        //ez a kettő lehetne akár egy method is...
        if(tipBoolean){
            ViewController.order.price = ViewController.order.price! + 350
            PizzaController.price_placeholder =
                PizzaController.price_placeholder + 350
        }
        ViewController.order.instruction = leaveInst.text!
        
       
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.order.price = 780
        ViewController.order.set = "35cm"
        ViewController.order.name = "Pizza"
        ViewController.order.type = "Meat"
        ViewController.order.withExtra = false
        ViewController.order.instruction = "none"
        ViewController.order.deliveryTime = 47
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
