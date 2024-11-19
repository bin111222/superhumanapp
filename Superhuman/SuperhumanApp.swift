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
