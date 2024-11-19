import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var profile: UserProfile
    @Published var isEditMode = false
    
    init() {
        if let savedProfile = UserDefaultsManager.shared.loadUserProfile() {
            self.profile = savedProfile
        } else {
            // Provide default profile if none exists
            self.profile = UserProfile(
                name: "",
                email: "",
                age: 0,
                height: 170,
                weight: 70,
                fitnessLevel: .beginner,
                notificationsEnabled: true,
                preferredWorkoutTime: Date()
            )
        }
    }
    
    func updateProfile() {
        UserDefaultsManager.shared.saveUserProfile(profile)
    }
    
    func signOut() {
        // TODO: Implement sign out logic
        print("User signed out")
    }
} 