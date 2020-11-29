//
//  LaunchInterfaceController.swift
//  RosAtomApp WatchKit Extension
//
//  Created by Admin on 27.11.2020.
//

import UIKit
import WatchKit
import UserNotifications

class LaunchInterfaceController: WKInterfaceController {
        
    override func awake(withContext context: Any?) {
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { (result, error) in
            var dateComponents = DateComponents()
            dateComponents.hour = 4
            dateComponents.minute = 57
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

            //Set your content
            let content = UNMutableNotificationContent()
            content.title = "Новая задача"
            content.body = "Наладка оборудования в машинном зале"

            let request = UNNotificationRequest(
                identifier: "yourIdentifier", content: content, trigger: trigger
            )
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}
