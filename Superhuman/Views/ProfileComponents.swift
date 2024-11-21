import SwiftUI

// MARK: - Profile Header
struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var showingImagePicker: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            // Profile Image
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 120, height: 120)
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(SuperhumanTheme.primaryColor)
                
                if viewModel.isEditMode {
                    Button {
                        showingImagePicker = true
                    } label: {
                        Circle()
                            .fill(Color.black.opacity(0.5))
                            .frame(width: 120, height: 120)
                            .overlay(
                                Image(systemName: "camera.fill")
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
            
            // Name and Status
            VStack(spacing: 8) {
                Text(viewModel.profile.name)
                    .font(.title2.bold())
                
                Text(viewModel.profile.fitnessLevel.rawValue)
                    .font(.subheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(SuperhumanTheme.primaryColor.opacity(0.2))
                    .foregroundColor(SuperhumanTheme.primaryColor)
                    .clipShape(Capsule())
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.3))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

// MARK: - Profile Content
struct ProfileContentView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var showingSignOutAlert: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            // Personal Information
            ProfileSection(title: "Personal Information") {
                if viewModel.isEditMode {
                    EditablePersonalInfoView(viewModel: viewModel)
                } else {
                    PersonalInfoView(viewModel: viewModel)
                }
            }
            
            // Preferences
            ProfileSection(title: "Preferences") {
                PreferencesView(viewModel: viewModel)
            }
            
            // App Settings
            ProfileSection(title: "App Settings") {
                AppSettingsView(showingSignOutAlert: $showingSignOutAlert)
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Input Components
struct ProfileTextField: View {
    let title: String
    @Binding var text: String
    var error: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField(title, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(error != nil ? Color.red : Color.gray.opacity(0.3), lineWidth: 1)
                )
            
            if let error = error {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ProfileNumberField: View {
    let title: String
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            TextField("", value: $value, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
                .multilineTextAlignment(.trailing)
                .keyboardType(.decimalPad)
        }
    }
}

// MARK: - Supporting Views
struct EditButton: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        Button(viewModel.isEditMode ? "Save" : "Edit") {
            if viewModel.isEditMode {
                viewModel.updateProfile()
            }
            viewModel.isEditMode.toggle()
        }
        .foregroundColor(SuperhumanTheme.primaryColor)
    }
}

struct EditablePersonalInfoView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            ProfileTextField(title: "Name", text: $viewModel.editableProfile.name, error: viewModel.nameError)
            ProfileTextField(title: "Email", text: $viewModel.editableProfile.email, error: viewModel.emailError)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
            
            ProfileStepper(title: "Age", value: $viewModel.editableProfile.age, range: 18...100, error: viewModel.ageError)
            
            ProfileNumberField(title: "Height (cm)", value: $viewModel.editableProfile.height)
            ProfileNumberField(title: "Weight (kg)", value: $viewModel.editableProfile.weight)
        }
    }
}

struct PersonalInfoView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            ProfileInfoRow(title: "Name", value: viewModel.profile.name)
            ProfileInfoRow(title: "Email", value: viewModel.profile.email)
            ProfileInfoRow(title: "Age", value: "\(viewModel.profile.age)")
            ProfileInfoRow(title: "Height", value: "\(Int(viewModel.profile.height)) cm")
            ProfileInfoRow(title: "Weight", value: "\(Int(viewModel.profile.weight)) kg")
        }
    }
}

struct PreferencesView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            ProfilePicker(title: "Fitness Level",
                         selection: viewModel.isEditMode ? $viewModel.editableProfile.fitnessLevel : $viewModel.profile.fitnessLevel,
                         options: UserProfile.FitnessLevel.allCases)
            
            ProfileDatePicker(title: "Preferred Workout Time",
                            date: viewModel.isEditMode ? $viewModel.editableProfile.preferredWorkoutTime : $viewModel.profile.preferredWorkoutTime)
            
            Toggle("Enable Notifications", isOn: $viewModel.editableProfile.notificationsEnabled)
                .onChange(of: viewModel.editableProfile.notificationsEnabled) { oldValue, newValue in
                    viewModel.toggleNotifications()
                }
        }
    }
}

struct AppSettingsView: View {
    @Binding var showingSignOutAlert: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            NavigationLink("Privacy Policy") {
                Text("Privacy Policy Content")
            }
            NavigationLink("Terms of Service") {
                Text("Terms of Service Content")
            }
            NavigationLink("Help & Support") {
                Text("Help & Support Content")
            }
            
            Button(role: .destructive) {
                showingSignOutAlert = true
            } label: {
                Text("Sign Out")
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

// Add these missing components
struct ProfileSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.headline)
                .foregroundColor(SuperhumanTheme.primaryColor)
            
            content
                .padding()
                .background(Color.black.opacity(0.3))
                .cornerRadius(15)
        }
    }
}

struct ProfileStepper: View {
    let title: String
    @Binding var value: Int
    let range: ClosedRange<Int>
    var error: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                Spacer()
                Stepper("\(value)", value: $value, in: range)
                    .fixedSize()
            }
            
            if let error = error {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ProfilePicker<T: Hashable & CaseIterable>: View where T: RawRepresentable, T.RawValue == String {
    let title: String
    @Binding var selection: T
    let options: [T]
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Picker("", selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.menu)
        }
    }
}

struct ProfileDatePicker: View {
    let title: String
    @Binding var date: Date
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            DatePicker("", selection: $date, displayedComponents: [.hourAndMinute])
                .labelsHidden()
        }
    }
}

struct ProfileInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .foregroundColor(.white)
        }
    }
}