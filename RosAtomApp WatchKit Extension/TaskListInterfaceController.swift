//
//  TaskListInterfaceController.swift
//  RosAtomApp WatchKit Extension
//
//  Created by Admin on 27.11.2020.
//

import UIKit
import WatchKit

class TaskListInterfaceController: WKInterfaceController {

    
    @IBOutlet weak var tableView: WKInterfaceTable!
    @IBAction func `switch`(_ value: Bool) {
    }
    
    override func awake(withContext context: Any?) {
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
}
