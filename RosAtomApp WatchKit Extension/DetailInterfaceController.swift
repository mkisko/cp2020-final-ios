//
//  DetailInterfaceController.swift
//  RosAtomApp WatchKit Extension
//
//  Created by Admin on 29.11.2020.
//

import WatchKit
import Foundation


class DetailInterfaceController: WKInterfaceController {

    @IBOutlet weak var descriptionLabel: WKInterfaceLabel!
    @IBAction func completeButton() {
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let task = context as! WatchTaskModel
        descriptionLabel.setText("\(task.title)\n\(task.desc)")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
