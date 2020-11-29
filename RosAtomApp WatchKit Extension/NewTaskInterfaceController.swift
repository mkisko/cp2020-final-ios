//
//  NewTaskInterfaceController.swift
//  RosAtomApp WatchKit Extension
//
//  Created by Admin on 27.11.2020.
//

import WatchKit
import Foundation


class NewTaskInterfaceController: WKInterfaceController {
    @IBAction func sendButton() {
        let alert = WKAlertAction(title: "OK", style: .default) {
            self.pushController(withName: "launch", context: nil)
        }
        presentAlert(withTitle: "Успешно", message: "Сообщение отправлено", preferredStyle: .alert, actions: [alert])
    }
    @IBOutlet weak var textField: WKInterfaceTextField!
    @IBAction func clearButton() {
        textField.setText("")
    }
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
