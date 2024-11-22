import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var currentPage = 0
    @Environment(\.dismiss) private var dismiss
    @State private var shouldShowMainContent = false
    
    let onboardingPages = [
        OnboardingPage(
            image: "Superhuman",
            isSystemImage: false,
            title: "Ready to be a Superhuman?",
            description: "30 minutes a day can transform your life."
        ),
        OnboardingPage(
            image: "figure.mind.and.body",
            title: "Holistic Approach",
            description: "Target specific body parts with customized exercises, healing practices, and training modules."
        ),
        OnboardingPage(
            image: "chart.line.uptrend.xyaxis",
            title: "Track Your Progress",
            description: "The aim is to be 1% better everyday to be 37 times better by the end of the year"
        )
    ]
    
    var body: some View {
        Group {
            if viewModel.showUserDetails {
                UserDetailsView(viewModel: viewModel, shouldShowMainContent: $shouldShowMainContent)
            } else {
                ZStack {
                    AnimatedMeshGradient()
                    
                    TabView(selection: $currentPage) {
                        ForEach(0..<onboardingPages.count, id: \.self) { index in
                            OnboardingPageView(page: onboardingPages[index]) {
                                if index == onboardingPages.count - 1 {
                                    viewModel.showUserDetails = true
                                } else {
                                    withAnimation {
                                        currentPage += 1
                                    }
                                }
                            }
                            .tag(index)
                        }
                    }
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                }
            }
        }
        .fullScreenCover(isPresented: $shouldShowMainContent) {
            ContentView()
        }
    }
}

// MARK: - Supporting Views
struct OnboardingPageView: View {
    let page: OnboardingPage
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
            
            Group {
                if page.isSystemImage {
                    Image(systemName: page.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.white)
                } else {
                    Image(page.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                       
                }
            }
            
            VStack(spacing: 16) {
                Text(page.title)
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                
                Text(page.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding()
            
            OnboardingButton(text: "Continue", action: action)
                .padding(.horizontal)
            
            Spacer()
                .frame(height: 10)
        }
    }
}

struct UserDetailsView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @Binding var shouldShowMainContent: Bool
    @Environment(\.colorScheme) var colorScheme
    @State private var currentSection = 0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            TabView(selection: $currentSection) {
                basicInfoSection
                    .tag(0)
                
                bodyMetricsSection
                    .tag(1)
                
                preferencesSection
                    .tag(2)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .foregroundColor(.white)
    }
    
    private var basicInfoSection: some View {
        VStack(spacing: 30) {
            HeaderView(title: "Tell us about yourself", subtitle: "Let's get to know you better")
            
            VStack(spacing: 25) {
                CustomTextField(
                    icon: "person.fill",
                    placeholder: "Your Name",
                    text: $viewModel.name
                )
                
                CustomTextField(
                    icon: "number",
                    placeholder: "Age",
                    text: $viewModel.ageText,
                    keyboardType: .numberPad
                )
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            NavigationButton(text: "Next") {
                hideKeyboard()
                withAnimation {
                    currentSection = 1
                }
            }
            .disabled(viewModel.name.isEmpty || viewModel.ageText.isEmpty)
        }
        .padding(.vertical, 50)
        .onTapGesture {
            hideKeyboard()
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    hideKeyboard()
                }
                .foregroundColor(SuperhumanTheme.primaryColor)
            }
        }
    }
    
    private var bodyMetricsSection: some View {
        VStack(spacing: 30) {
            HeaderView(title: "Body Metrics", subtitle: "Help us personalize your experience")
            
            VStack(spacing: 25) {
                HeightSelector(heightCM: $viewModel.heightText, sliderValue: $viewModel.heightValue)
                WeightSelector(weightKG: $viewModel.weightText, sliderValue: $viewModel.weightValue)
                
                if let bmi = viewModel.calculateBMI() {
                    BMIIndicator(bmi: bmi)
                }
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            NavigationButton(text: "Next") {
                withAnimation {
                    currentSection = 2
                }
            }
        }
        .padding(.vertical, 50)
    }
    
    private var preferencesSection: some View {
        VStack(spacing: 30) {
            HeaderView(title: "Final Steps", subtitle: "Customize your experience")
            
            VStack(spacing: 25) {
                FitnessLevelSelector(selectedLevel: $viewModel.fitnessLevel)
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            NavigationButton(text: "Get Started") {
                viewModel.completeOnboarding()
                UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
                shouldShowMainContent = true
            }
        }
        .padding(.vertical, 50)
    }
}

#Preview {
    OnboardingView()
} 
