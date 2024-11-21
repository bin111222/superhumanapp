import SwiftUI
import UIKit

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                HomeView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(0)
                
                DailyMovementView()
                    .tabItem {
                        Label("Dailies", systemImage: "figure.mixed.cardio.circle.fill")
                    }
                    .tag(1)
                
                ExercisesView()
                    .tabItem {
                        Label("Exercises", systemImage: "dumbbell.fill")
                    }
                    .tag(2)
                
                MentalWellnessView()
                    .tabItem {
                        Label("Mind", systemImage: "brain.head.profile.fill")
                    }
                    .tag(3)
                
                ProgressView()
                    .tabItem {
                        Label("Progress", systemImage: "chart.bar.fill")
                    }
                    .tag(4)
            }
            .tint(SuperhumanTheme.primaryColor)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("LaunchLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                }
            }
        }
        .onAppear {
            // Configure navigation bar appearance
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .black
            appearance.shadowColor = .clear
            
            // Reduce navigation bar height
            appearance.backgroundEffect = nil
            appearance.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
            
            // Apply compact appearance
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = .black
            
            // Apply the appearance settings
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
            // Set compact metrics
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().prefersLargeTitles = false
            
            // Configure tab bar appearance
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(AppSettings())
        .preferredColorScheme(.dark)
} 
