//
//  SuperhumanApp.swift
//  Superhuman
//
//  Created by varil shah on 19/11/24.
//

import SwiftUI
import HealthKit

@main
struct SuperhumanApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let healthStore = HKHealthStore()
    @StateObject private var appSettings = AppSettings()
    
    var body: some Scene {
        WindowGroup {
            LoadingView()
                .environmentObject(appSettings)
                .preferredColorScheme(.dark)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
