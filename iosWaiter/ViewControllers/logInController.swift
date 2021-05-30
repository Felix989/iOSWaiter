//
//  logInController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 22..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit

class logInController: UIViewController {

    @IBOutlet weak var prompt: UILabel!
    @IBOutlet weak var getNickName: UITextField!
    @IBOutlet weak var getPassword: UITextField!
    
    var nm = ""
    var pw = ""
    public static var letVar: Bool = false
    
    
    @IBAction func loginButton(_ sender: Any) {
        nm = getNickName.text!
        pw = getPassword.text!
        var user = User(n: nm,p: pw)
        var log = User.logInUser(user: user)
        
        if(logInController.letVar){
            prompt.text = "Log in successful!"
            sleep(1)
            self.performSegue(withIdentifier: "manualSegue", sender: self)
        } else {
            prompt.text = "Can't log in!"
            //Person.getData()
        }
    }
    
    
/*
    @IBAction func logInButton(_ sender: UIButton) {
        nm = getNickName.text!
        pw = getPassword.text!
        if(nm == "nm" && pw == "pw"){
            prompt.text = "Log in successful!"
            
            let story = UIStoryboard(name: "logInScreen", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "restaurantChooser") as! ViewController
            self.present(controller, animated: true, completion: nil)
            
        } else {
            prompt.text = "Can't log in!"
        }
    }*/

    @IBAction func registerButton(_ sender: UIButton) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
