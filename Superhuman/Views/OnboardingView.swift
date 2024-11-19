import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var currentPage = 0
    @Environment(\.dismiss) private var dismiss
    @State private var shouldShowMainContent = false
    
    let onboardingPages = [
        OnboardingPage(
            image: "figure.walk",
            title: "Welcome to Superhuman",
            description: "Your journey to becoming superhuman starts here. Just 30 minutes a day can transform your life."
        ),
        OnboardingPage(
            image: "figure.mind.and.body",
            title: "Holistic Approach",
            description: "Target specific body parts with customized exercises, healing practices, and training modules."
        ),
        OnboardingPage(
            image: "chart.line.uptrend.xyaxis",
            title: "Track Your Progress",
            description: "Monitor your improvements and celebrate your achievements as you become stronger every day."
        )
    ]
    
    var body: some View {
        Group {
            if viewModel.showUserDetails {
                UserDetailsView(viewModel: viewModel, shouldShowMainContent: $shouldShowMainContent)
            } else {
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
        .fullScreenCover(isPresented: $shouldShowMainContent) {
            ContentView()
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
            // Background
            Color.black
                .ignoresSafeArea()
            
            TabView(selection: $currentSection) {
                // Basic Info Section
                basicInfoSection
                    .tag(0)
                
                // Body Metrics Section
                bodyMetricsSection
                    .tag(1)
                
                // Preferences Section
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
            headerView("Tell us about yourself", subtitle: "Let's get to know you better")
            
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
                withAnimation {
                    currentSection = 1
                }
            }
            .disabled(viewModel.name.isEmpty || viewModel.ageText.isEmpty)
        }
        .padding(.vertical, 50)
    }
    
    private var bodyMetricsSection: some View {
        VStack(spacing: 30) {
            headerView("Body Metrics", subtitle: "Help us personalize your experience")
            
            VStack(spacing: 25) {
                // Height Selector
                HeightSelector(heightCM: $viewModel.heightText, sliderValue: $viewModel.heightValue)
                
                // Weight Selector
                WeightSelector(weightKG: $viewModel.weightText, sliderValue: $viewModel.weightValue)
                
                // BMI Indicator
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
            .disabled(viewModel.heightText.isEmpty || viewModel.weightText.isEmpty)
        }
        .padding(.vertical, 50)
    }
    
    private var preferencesSection: some View {
        VStack(spacing: 30) {
            headerView("Final Steps", subtitle: "Customize your experience")
            
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

// MARK: - Supporting Views
struct CustomTextField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(SuperhumanTheme.primaryColor)
                .frame(width: 24)
            
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder).foregroundColor(.gray)
                }
                .keyboardType(keyboardType)
                .foregroundColor(.white)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white.opacity(0.1))
        )
    }
}

struct FitnessLevelSelector: View {
    @Binding var selectedLevel: UserProfile.FitnessLevel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Fitness Level")
                .font(.headline)
            
            ForEach(UserProfile.FitnessLevel.allCases, id: \.self) { level in
                Button {
                    withAnimation {
                        selectedLevel = level
                    }
                } label: {
                    HStack {
                        Text(level.rawValue)
                            .foregroundColor(.white)
                        Spacer()
                        if selectedLevel == level {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(SuperhumanTheme.primaryColor)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(selectedLevel == level ? Color.white.opacity(0.2) : Color.white.opacity(0.1))
                    )
                }
            }
        }
    }
}

struct OnboardingPageView: View {
    let page: OnboardingPage
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            Image(systemName: page.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(SuperhumanTheme.primaryColor)
            
            VStack(spacing: 16) {
                Text(page.title)
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                
                Text(page.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            .padding()
            
            OnboardingButton(text: "Continue", action: action)
                .padding(.horizontal)
            
            Spacer()
                .frame(height: 60) // Add space for page dots
        }
    }
}

class OnboardingViewModel: ObservableObject {
    @Published var showUserDetails = false
    @Published var name = ""
    @Published var ageText = ""
    @Published var heightText = ""
    @Published var weightText = ""
    @Published var heightValue: Double = 170 // Default height in cm
    @Published var weightValue: Double = 70  // Default weight in kg
    @Published var fitnessLevel: UserProfile.FitnessLevel = .beginner
    @Published var preferredWorkoutTime = Date()
    @Published var notificationsEnabled = true
    
    var isValidForm: Bool {
        !name.isEmpty &&
        !ageText.isEmpty &&
        !heightText.isEmpty &&
        !weightText.isEmpty &&
        Int(ageText) != nil
    }
    
    func calculateBMI() -> Double? {
        let heightInMeters = heightValue / 100
        return weightValue / (heightInMeters * heightInMeters)
    }
    
    func completeOnboarding() {
        let profile = UserProfile(
            name: name,
            email: "", // We can add email collection later if needed
            age: Int(ageText) ?? 0,
            height: heightValue,
            weight: weightValue,
            fitnessLevel: fitnessLevel,
            notificationsEnabled: notificationsEnabled,
            preferredWorkoutTime: preferredWorkoutTime
        )
        
        // TODO: Save profile to UserDefaults or backend
        print("Profile created:", profile)
    }
}

// New Components for Height and Weight Selection
struct HeightSelector: View {
    @Binding var heightCM: String
    @Binding var sliderValue: Double
    
    var heightInFeetInches: String {
        let totalInches = sliderValue / 2.54
        let feet = Int(totalInches / 12)
        let inches = Int(totalInches.truncatingRemainder(dividingBy: 12))
        return "\(feet)'\(inches)\""
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Height")
                .font(.headline)
            
            VStack(spacing: 5) {
                HStack {
                    Text("\(Int(sliderValue)) cm")
                        .font(.title3)
                    Spacer()
                    Text(heightInFeetInches)
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                
                Slider(value: $sliderValue, in: 120...220, step: 1) { _ in
                    heightCM = String(Int(sliderValue))
                }
                .tint(SuperhumanTheme.primaryColor)
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(15)
        }
    }
}

struct WeightSelector: View {
    @Binding var weightKG: String
    @Binding var sliderValue: Double
    
    var weightInLbs: String {
        let lbs = sliderValue * 2.20462
        return String(format: "%.1f lbs", lbs)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Weight")
                .font(.headline)
            
            VStack(spacing: 5) {
                HStack {
                    Text("\(Int(sliderValue)) kg")
                        .font(.title3)
                    Spacer()
                    Text(weightInLbs)
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                
                Slider(value: $sliderValue, in: 30...200, step: 0.5) { _ in
                    weightKG = String(sliderValue)
                }
                .tint(SuperhumanTheme.primaryColor)
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(15)
        }
    }
}

struct BMIIndicator: View {
    let bmi: Double
    
    var bmiCategory: (String, Color) {
        switch bmi {
        case ..<18.5:
            return ("Underweight", .yellow)
        case 18.5..<25:
            return ("Normal", .green)
        case 25..<30:
            return ("Overweight", .orange)
        default:
            return ("Obese", .red)
        }
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text("BMI")
                .font(.headline)
            
            Text(String(format: "%.1f", bmi))
                .font(.title2.bold())
            
            Text(bmiCategory.0)
                .font(.subheadline)
                .foregroundColor(bmiCategory.1)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.1))
        .cornerRadius(15)
    }
}

struct NavigationButton: View {
    let text: String
    let action: () -> Void
    var disabled: Bool = false
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title3.bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(disabled ? Color.gray : SuperhumanTheme.primaryColor)
                )
                .padding(.horizontal, 30)
        }
        .disabled(disabled)
    }
}

private func headerView(_ title: String, subtitle: String) -> some View {
    VStack(spacing: 10) {
        Text(title)
            .font(.title.bold())
        
        Text(subtitle)
            .font(.subheadline)
            .foregroundColor(.gray)
    }
    .multilineTextAlignment(.center)
    .padding(.horizontal)
}

// MARK: - Helper Extension
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

#Preview {
    OnboardingView()
} 