//
//  SettingsController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 24..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit

class SettingsController: UIViewController{
    
    public static var settings = savedSettings()
    
    @IBOutlet weak var ageIndicator: UILabel!
    
    @IBAction func ageSlider(_ sender: UISlider) {
        ageIndicator.text = String(Int(sender.value))
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var streetField: UITextField!
    
    @IBOutlet weak var houseField: UITextField!
    
    @IBOutlet weak var prompt: UILabel!
    
    @IBAction func saveButtoin(_ sender: UIButton) {
        SettingsController.settings.name = nameField.text
        SettingsController.settings.phone = phoneField.text
        SettingsController.settings.house = houseField.text
        SettingsController.settings.street = streetField.text
        SettingsController.settings.age = Int(ageIndicator.text!)
        prompt.text = "Everything is saved!"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
