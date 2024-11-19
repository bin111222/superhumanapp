import SwiftUI

// MARK: - Onboarding Page Model
struct OnboardingPage: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
}

// MARK: - Custom Components
struct OnboardingButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(.title3, design: .rounded).weight(.semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(SuperhumanTheme.primaryColor)
                .cornerRadius(16)
                .shadow(radius: 10)
        }
        .padding(.horizontal)
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