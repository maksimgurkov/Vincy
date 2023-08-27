//
//  AppDelegate.swift
//  Vincy
//
//  Created by Максим Гурков on 27.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var isOn = true
    private var userDefaults = UserDefaults.standard.bool(forKey: "false")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if !userDefaults {
            let startModule = StartAssembly.assemble()
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = startModule
            window?.makeKeyAndVisible()
            UserDefaults.standard.set(isOn, forKey: "false")
        } else {
            
        }
        return true
    }

}

