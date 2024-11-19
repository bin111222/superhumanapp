import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showingSignOutAlert = false
    
    var body: some View {
        NavigationView {
            List {
                // Profile Header
                ProfileHeader(profile: $viewModel.profile, isEditMode: viewModel.isEditMode)
                
                // Personal Information
                Section("Personal Information") {
                    if viewModel.isEditMode {
                        TextField("Name", text: $viewModel.profile.name)
                        TextField("Email", text: $viewModel.profile.email)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                        
                        Stepper("Age: \(viewModel.profile.age)", value: $viewModel.profile.age, in: 18...100)
                        
                        HStack {
                            Text("Height")
                            Spacer()
                            TextField("Height", value: $viewModel.profile.height, format: .number)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            Text("cm")
                        }
                        
                        HStack {
                            Text("Weight")
                            Spacer()
                            TextField("Weight", value: $viewModel.profile.weight, format: .number)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                            Text("kg")
                        }
                    } else {
                        LabeledContent("Name", value: viewModel.profile.name)
                        LabeledContent("Email", value: viewModel.profile.email)
                        LabeledContent("Age", value: "\(viewModel.profile.age)")
                        LabeledContent("Height", value: "\(Int(viewModel.profile.height)) cm")
                        LabeledContent("Weight", value: "\(Int(viewModel.profile.weight)) kg")
                    }
                }
                
                // Preferences
                Section("Preferences") {
                    Picker("Fitness Level", selection: $viewModel.profile.fitnessLevel) {
                        ForEach(UserProfile.FitnessLevel.allCases, id: \.self) { level in
                            Text(level.rawValue).tag(level)
                        }
                    }
                    
                    DatePicker(
                        "Preferred Workout Time",
                        selection: $viewModel.profile.preferredWorkoutTime,
                        displayedComponents: .hourAndMinute
                    )
                    
                    Toggle("Enable Notifications", isOn: $viewModel.profile.notificationsEnabled)
                }
                
                // App Settings
                Section("App Settings") {
                    NavigationLink("Privacy Policy") {
                        PrivacyPolicyView()
                    }
                    NavigationLink("Terms of Service") {
                        TermsOfServiceView()
                    }
                    NavigationLink("Help & Support") {
                        HelpSupportView()
                    }
                }
                
                // Sign Out
                Section {
                    Button(role: .destructive) {
                        showingSignOutAlert = true
                    } label: {
                        HStack {
                            Spacer()
                            Text("Sign Out")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(viewModel.isEditMode ? "Save" : "Edit") {
                        if viewModel.isEditMode {
                            viewModel.updateProfile()
                        }
                        viewModel.isEditMode.toggle()
                    }
                }
            }
            .alert("Sign Out", isPresented: $showingSignOutAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Sign Out", role: .destructive) {
                    viewModel.signOut()
                }
            } message: {
                Text("Are you sure you want to sign out?")
            }
        }
    }
}

// MARK: - Supporting Views
private struct ProfileHeader: View {
    @Binding var profile: UserProfile
    let isEditMode: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(SuperhumanTheme.primaryColor)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(profile.name)
                    .font(SuperhumanTheme.headlineFont)
                Text(profile.email)
                    .font(SuperhumanTheme.bodyFont)
                    .foregroundColor(.gray)
                Text(profile.fitnessLevel.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(SuperhumanTheme.primaryColor.opacity(0.2))
                    .foregroundColor(SuperhumanTheme.primaryColor)
                    .cornerRadius(8)
            }
            Spacer()
        }
        .padding(.vertical)
    }
}

// Placeholder Views
struct PrivacyPolicyView: View {
    var body: some View {
        Text("Privacy Policy")
            .navigationTitle("Privacy Policy")
    }
}

struct TermsOfServiceView: View {
    var body: some View {
        Text("Terms of Service")
            .navigationTitle("Terms of Service")
    }
}

struct HelpSupportView: View {
    var body: some View {
        Text("Help & Support")
            .navigationTitle("Help & Support")
    }
}

#Preview {
    ProfileView()
} 