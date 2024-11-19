import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var profile: UserProfile
    @Published var isEditMode = false
    
    init() {
        // TODO: Load from UserDefaults or backend
        self.profile = UserProfile(
            name: "John Doe",
            email: "john@example.com",
            age: 30,
            height: 175,
            weight: 70,
            fitnessLevel: .intermediate,
            notificationsEnabled: true,
            preferredWorkoutTime: Calendar.current.date(from: DateComponents(hour: 8, minute: 0)) ?? Date()
        )
    }
    
    func updateProfile() {
        // TODO: Save to UserDefaults or backend
        print("Profile updated")
    }
    
    func signOut() {
        // TODO: Implement sign out logic
        print("User signed out")
    }
} 