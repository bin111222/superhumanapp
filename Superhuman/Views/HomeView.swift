import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appSettings: AppSettings
    @State private var userName: String = UserDefaultsManager.shared.loadUserProfile()?.name ?? "there"
    @State private var showProfile = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    // Welcome Header
                    Text("Hey, \(userName)! Let's get going?")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 16)
                    
                    // Bento Box Grid
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 24) {
                        // Physical Exercise Box
                        NavigationLink(destination: DailyMovementView()) {
                            BentoBox(
                                title: "Physical Exercise",
                                description: "Daily movement challenges for body maintenance and strength",
                                systemImage: "figure.mixed.cardio.circle.fill",
                                gradient: [Color.black, SuperhumanTheme.primaryColor.opacity(0.7)]
                            )
                        }
                        
                        // Mental Wellness Box
                        NavigationLink(destination: MentalWellnessView()) {
                            BentoBox(
                                title: "Mental Wellness",
                                description: "Meditation, breathing exercises, and mindfulness practices",
                                systemImage: "brain.head.profile",
                                gradient: [Color.black, Color.blue]
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 16)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BentoBox: View {
    let title: String
    let description: String
    let systemImage: String
    let gradient: [Color]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Icon
            Image(systemName: systemImage)
                .font(.system(size: 32))
                .foregroundColor(.white)
                .padding(.bottom, 4)
            
            // Text Content
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(24)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradient),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    HomeView()
        .environmentObject(AppSettings())
        .preferredColorScheme(.dark)
} 
            
