//
//  AppDelegate.swift
//  PushNotificationProject
//
//  Created by Aashwatth Agarwal on 7/30/19.
//  Copyright © 2019 Aashwatth Agarwal. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        UNUserNotificationCenter.current().requestAuthorization (options: [.alert, .badge, .sound]) { (authorized, error) in
            print("Authorized? \(authorized)")
            print(error?.localizedDescription ?? "No Error")
            guard authorized else {return}
            
            DispatchQueue.main.async {
                 UIApplication.shared.registerForRemoteNotifications()
                self.sendNotification()
            }
        }
        return true
    }
    
    func sendNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Cricket sounds"
        content.badge = 999
        content.body = "coolest cricket ever"
        content.subtitle = "seriously cool cricket"
        content.sound = .defaultCritical
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: "cool notification", content: content, trigger: trigger)
            
        UNUserNotificationCenter.current().add(request) { error in print(error?.localizedDescription ?? "No error")}
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
}
