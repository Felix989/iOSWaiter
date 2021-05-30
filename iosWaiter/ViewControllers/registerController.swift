//
//  registerController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 22..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit

class registerController: UIViewController{
    
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var pw: UITextField!
    
    
    
    @IBAction func register(_ sender: UIButton) {
        let nm = name.text
        let passw = pw.text
        let user = User(n: nm!,p: passw!)
        
        User.saveUser(user: user)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
