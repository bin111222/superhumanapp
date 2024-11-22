import SwiftUI

// MARK: - Models
struct OnboardingPage: Identifiable {
    let id = UUID()
    let image: String
    let isSystemImage: Bool
    let title: String
    let description: String
    
    init(image: String, isSystemImage: Bool = true, title: String, description: String) {
        self.image = image
        self.isSystemImage = isSystemImage
        self.title = title
        self.description = description
    }
}

// MARK: - Components
struct OnboardingButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title3.bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(SuperhumanTheme.primaryColor)
                )
                .padding(.horizontal, 30)
        }
    }
}

struct AnimatedTextField: View {
    let title: String
    @Binding var text: String
    let keyboardType: UIKeyboardType
    @State private var isEditing = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
                .opacity(text.isEmpty && !isEditing ? 0 : 1)
                .offset(y: text.isEmpty && !isEditing ? 20 : 0)
            
            TextField(isEditing || !text.isEmpty ? "" : title, text: $text)
                .keyboardType(keyboardType)
                .font(.system(.body, design: .rounded))
                .padding(.vertical, 8)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(isEditing ? SuperhumanTheme.primaryColor : .gray)
                        .offset(y: 4)
                )
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.2)) {
                        isEditing = true
                    }
                }
        }
        .padding(.top, 8)
    }
}

struct FitnessLevelPicker: View {
    @Binding var selectedLevel: UserProfile.FitnessLevel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("What's your fitness level?")
                .font(.title2.bold())
                .multilineTextAlignment(.center)
            
            ForEach(UserProfile.FitnessLevel.allCases, id: \.self) { level in
                Button {
                    withAnimation {
                        selectedLevel = level
                    }
                } label: {
                    HStack {
                        Text(level.rawValue)
                            .font(.system(.body, design: .rounded))
                        Spacer()
                        if selectedLevel == level {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(SuperhumanTheme.primaryColor)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(selectedLevel == level ? SuperhumanTheme.primaryColor : Color.gray.opacity(0.3))
                    )
                }
                .foregroundColor(.primary)
            }
        }
        .padding()
    }
}

// MARK: - Helper Views
struct HeaderView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
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
                .foregroundColor(.white)
            
            VStack(spacing: 5) {
                HStack {
                    Text("\(Int(sliderValue)) cm")
                        .font(.title3)
                        .foregroundColor(.white)
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
                .foregroundColor(.white)
            
            VStack(spacing: 5) {
                HStack {
                    Text("\(Int(sliderValue)) kg")
                        .font(.title3)
                        .foregroundColor(.white)
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
                .foregroundColor(.white)
            
            Text(String(format: "%.1f", bmi))
                .font(.title2.bold())
                .foregroundColor(.white)
            
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

// MARK: - Helper Extensions
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

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
                    Text(placeholder)
                        .foregroundColor(Color.gray)
                }
                .keyboardType(keyboardType)
                .foregroundColor(Color.white)
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
        VStack(spacing: 16) {
            Text("What's your fitness level?")
                .font(.title2.bold())
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            
            ForEach(UserProfile.FitnessLevel.allCases, id: \.self) { level in
                Button {
                    withAnimation {
                        selectedLevel = level
                    }
                } label: {
                    HStack {
                        Text(level.rawValue.capitalized)
                            .font(.system(.body, design: .rounded))
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
                            .fill(Color.white.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(selectedLevel == level ? SuperhumanTheme.primaryColor : Color.clear)
                            )
                    )
                }
            }
        }
        .padding()
    }
} 