import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showingSignOutAlert = false
    @State private var showingImagePicker = false
    @EnvironmentObject var appSettings: AppSettings
    @Environment(\.dismiss) var dismiss
    
    func handleSignOut() {
        // Clear UserDefaults
        UserDefaults.standard.removeObject(forKey: "hasCompletedOnboarding")
        UserDefaults.standard.removeObject(forKey: "userProfile")
        UserDefaults.standard.synchronize()
        
        // Reset app state
        appSettings.reset()
        
        // Post notification to reset app state
        NotificationCenter.default.post(name: .signOut, object: nil)
        
        // Dismiss the profile sheet
        dismiss()
    }
    
    var body: some View {
        ProfileContentWrapper(
            viewModel: viewModel,
            showingSignOutAlert: $showingSignOutAlert,
            showingImagePicker: $showingImagePicker,
            onSignOut: handleSignOut
        )
        .onChange(of: viewModel.profile.name) { _, newName in
            UserDefaultsManager.shared.saveUserProfile(viewModel.profile)
            NotificationCenter.default.post(name: .userProfileDidUpdate, object: nil)
        }
    }
}

struct ProfileContentWrapper: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Binding var showingSignOutAlert: Bool
    @Binding var showingImagePicker: Bool
    let onSignOut: () -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ProfileHeaderView(viewModel: viewModel, showingImagePicker: $showingImagePicker)
                ProfileContentView(viewModel: viewModel, showingSignOutAlert: $showingSignOutAlert)
            }
        }
        .background(Color.black)
        .navigationTitle("About You")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton(viewModel: viewModel)
            }
        }
        .alert("Sign Out", isPresented: $showingSignOutAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Sign Out", role: .destructive) {
                onSignOut()
            }
        } message: {
            Text("Are you sure you want to sign out? This will reset all your data.")
        }
        .alert(isPresented: $viewModel.showNotificationAlert) {
            switch viewModel.notificationAlertType {
            case .request:
                return Alert(
                    title: Text("Enable Notifications"),
                    message: Text("Would you like to receive workout reminders and updates?"),
                    primaryButton: .default(Text("Enable")),
                    secondaryButton: .cancel(Text("Not Now"))
                )
            case .denied:
                return Alert(
                    title: Text("Notifications Disabled"),
                    message: Text("Please enable notifications in Settings to receive workout reminders."),
                    primaryButton: .default(Text("Open Settings")) {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                    },
                    secondaryButton: .cancel()
                )
            case .settings:
                return Alert(
                    title: Text("Open Settings"),
                    message: Text("Please enable notifications in Settings."),
                    primaryButton: .default(Text("Open Settings")) {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}

#Preview {
    ProfileView()
} 