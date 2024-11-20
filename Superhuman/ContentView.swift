//
//  ContentView.swift
//  Superhuman
//
//  Created by varil shah on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appSettings: AppSettings
    @State private var hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
    @State private var showProfile = false
    
    var body: some View {
        Group {
            if !hasCompletedOnboarding {
                OnboardingView()
            } else {
                TabBarView()
                    .overlay(
                        Button(action: {
                            showProfile.toggle()
                        }) {
                            Image(systemName: "person.circle")
                                .font(.system(size: 22))
                                .foregroundColor(SuperhumanTheme.primaryColor)
                        }
                        .padding()
                        .offset(x: -16, y: -UIScreen.main.bounds.height/2 + 60)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                    )
                    .sheet(isPresented: $showProfile) {
                        NavigationStack {
                            ProfileView()
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppSettings())
}
