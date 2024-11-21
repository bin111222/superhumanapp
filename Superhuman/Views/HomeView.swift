import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appSettings: AppSettings
    @State private var userName: String = UserDefaultsManager.shared.loadUserProfile()?.name ?? "there"
    @State private var showProfile = false
    @State private var currentQuote = Quote.quotes.randomElement()!
    @State private var isRotating = false
    @State private var isChanging = false
    @Binding var selectedTab: Int
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    // Welcome Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Hey, \(userName.capitalized)!")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        AnimatedText(text: "Tomorrow's Growth, Starts Today")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(SuperhumanTheme.primaryColor)
                        
                        Text("Let's get going!")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(SuperhumanTheme.primaryColor)
                            .scaleEffect(isAnimating ? 1.1 : 1.0)
                            .animation(
                                Animation.easeInOut(duration: 5.0)
                                    .repeatForever(autoreverses: true),
                                value: isAnimating
                            )
                            .onAppear {
                                isAnimating = true
                            }
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    // Bento Box Grid
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 24) {
                        // Physical Exercise Box
                        Button {
                            selectedTab = 1 // Switch to Dailies tab
                        } label: {
                            BentoBox(
                                title: "Physical Exercise",
                                description: "Daily movement challenges for body maintenance and strength",
                                systemImage: "figure.mixed.cardio.circle.fill",
                                gradient: [Color.black, SuperhumanTheme.primaryColor.opacity(0.7)]
                            )
                        }
                        
                        // Mental Wellness Box
                        Button {
                            selectedTab = 3 // Switch to Mind tab
                        } label: {
                            BentoBox(
                                title: "Mental Wellness",
                                description: "Meditation, breathing exercises, and mindfulness practices",
                                systemImage: "brain.head.profile",
                                gradient: [Color.black, Color.blue]
                            )
                        }
                    }
                    .padding(.horizontal)

                    
                    // Quote Card
                    QuoteCard(quote: currentQuote, isRotating: $isRotating, isChanging: $isChanging) {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            isRotating.toggle()
                        }
                        
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isChanging = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            currentQuote = Quote.quotes.filter { $0.id != currentQuote.id }.randomElement()!
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isChanging = false
                            }
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

struct AnimatedText: View {
    let text: String
    @State private var isAnimating = false
    
    var body: some View {
        Text(text)
            .opacity(isAnimating ? 1 : 0.7)
            .scaleEffect(isAnimating ? 1.05 : 1)
            .animation(
                Animation.easeInOut(duration: 1.5)
                    .repeatForever(autoreverses: true),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
}

struct QuoteCard: View {
    let quote: Quote
    @Binding var isRotating: Bool
    @Binding var isChanging: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 20) {
                // Quote Icon
                Image(systemName: "quote.bubble.fill")
                    .font(.system(size: 40))
                    .foregroundColor(SuperhumanTheme.primaryColor)
                    .rotationEffect(.degrees(isRotating ? 360 : 0))
                    .padding(.top)
                
                // Quote Text
                VStack(spacing: 12) {
                    Text(quote.text)
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .opacity(isChanging ? 0 : 1)
                        .offset(y: isChanging ? 20 : 0)
                    
                    Text("— \(quote.author)")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.gray)
                        .opacity(isChanging ? 0 : 1)
                        .offset(y: isChanging ? 20 : 0)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(SuperhumanTheme.primaryColor.opacity(0.3), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
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
    HomeView(selectedTab: .constant(0))
        .environmentObject(AppSettings())
        .preferredColorScheme(.dark)
} 
            
