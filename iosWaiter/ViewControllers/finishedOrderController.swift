//
//  finishedOrderController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 22..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit

class finishedOrderController: UIViewController{

    
    @IBOutlet weak var minutePlaceholder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minutePlaceholder.text = String(ViewController.order.deliveryTime!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
