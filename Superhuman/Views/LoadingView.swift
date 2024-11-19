import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false
    @State private var showMainContent = false
    @State private var opacity = 0.0
    
    var body: some View {
        Group {
            if showMainContent {
                if UserDefaults.standard.bool(forKey: "hasCompletedOnboarding") {
                    ContentView()
                        .transition(.opacity)
                } else {
                    OnboardingView()
                        .transition(.opacity)
                }
            } else {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Image("LaunchLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .scaleEffect(isAnimating ? 1.1 : 0.9)

                    }
                    .opacity(opacity)
                }
            }
        }
        .onAppear {
            // Fade in the logo and text
            withAnimation(.easeIn(duration: 1.0)) {
                opacity = 1.0
            }
            
            // Start the pulse animation
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
            
            // Transition to main content after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeOut(duration: 0.3)) {
                    showMainContent = true
                }
            }
        }
    }
}

#Preview {
    LoadingView()
        .environmentObject(AppSettings())
} 
