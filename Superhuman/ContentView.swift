//
//  ContentView.swift
//  Superhuman
//
//  Created by varil shah on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appSettings: AppSettings
    @State private var selectedTab = 0
    @State private var showProfile = false
    @State private var hasCompletedOnboarding = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")
    
    var body: some View {
        Group {
            if !hasCompletedOnboarding {
                OnboardingView()
            } else {
                mainContent
            }
        }
    }
    
    private var mainContent: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(0)
                
                ExercisesView()
                    .tabItem {
                        Label("Exercises", systemImage: "figure.run")
                    }
                    .tag(1)
                
                ProgressView()
                    .tabItem {
                        Label("Progress", systemImage: "chart.bar.fill")
                    }
                    .tag(2)
            }
            .tint(SuperhumanTheme.primaryColor)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showProfile = true
                    } label: {
                        Image(systemName: "person.circle")
                            .font(.system(size: 22))
                            .foregroundColor(SuperhumanTheme.primaryColor)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 8) {
                        Image("LaunchLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                        
                
                    }
                }
            }
        }
        .sheet(isPresented: $showProfile) {
            NavigationStack {
                ProfileView()
            }
        }
        .onAppear {
            // Set default tab bar appearance
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = appearance
            
            // Set default navigation bar appearance
            let navigationAppearance = UINavigationBarAppearance()
            navigationAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppSettings())
}
