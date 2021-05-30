//
//  historyController.swift
//  iosWaiter
//
//  Created by Student on 2021. 05. 30..
//  Copyright © 2021. vetrabm. All rights reserved.
//

import Foundation
import UIKit

class historyController: UIViewController{
    
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    @IBAction func refresh(_ sender: UIButton) {
        self.viewDidLoad()
        historyController.dataSou = OrderedItem.getData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    
    
    //public static var data: [Person] = []
    public static var dataSou: Array<OrderedItem> = Array()
    //public static var dataSor = [Person]()
    
    public static var indexOfClick: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //historyController.data = Person.getData()
        //historyController.dataSou = Person.getData()
        //historyController.dataSor = Person.getData()
        OrderedItem.getData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}







//handles interactions of cells
extension historyController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        historyController.indexOfClick = indexPath.row
        self.performSegue(withIdentifier: "showAtIndex", sender: self)
        print("*clickity*", historyController.indexOfClick)
    }
    
}

extension historyController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return historyController.dataSou.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = historyController.dataSou[indexPath.row].name
        
        return cell

    }
}











