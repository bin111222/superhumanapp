import Foundation
import UIKit

class ProfileViewModel: ObservableObject {
    @Published var profile: UserProfile
    @Published var isEditMode = false
    @Published var editableProfile: UserProfile
    @Published var showingImagePicker = false
    @Published var profileImage: UIImage?
    
    // Validation states
    @Published var nameError: String?
    @Published var emailError: String?
    @Published var ageError: String?
    
    init() {
        if let savedProfile = UserDefaultsManager.shared.loadUserProfile() {
            self.profile = savedProfile
            self.editableProfile = savedProfile
        } else {
            // Provide default profile
            let defaultProfile = UserProfile(
                name: "",
                email: "",
                age: 0,
                height: 170,
                weight: 70,
                fitnessLevel: .beginner,
                notificationsEnabled: false,
                preferredWorkoutTime: Date()
            )
            self.profile = defaultProfile
            self.editableProfile = defaultProfile
        }
        
        loadProfileImage()
    }
    
    func validateProfile() -> Bool {
        var isValid = true
        
        // Name validation
        if editableProfile.name.isEmpty {
            nameError = "Name cannot be empty"
            isValid = false
        }
        
        // Email validation
        if !editableProfile.email.isEmpty && !isValidEmail(editableProfile.email) {
            emailError = "Invalid email format"
            isValid = false
        }
        
        // Age validation
        if editableProfile.age < 13 || editableProfile.age > 100 {
            ageError = "Age must be between 13 and 100"
            isValid = false
        }
        
        return isValid
    }
    
    func saveProfile() {
        guard validateProfile() else { return }
        
        profile = editableProfile
        UserDefaultsManager.shared.saveUserProfile(profile)
        
        if let image = profileImage {
            saveProfileImage(image)
        }
        
        isEditMode = false
    }
    
    func updateProfile() {
        guard validateProfile() else { return }
        
        profile = editableProfile
        UserDefaultsManager.shared.saveUserProfile(profile)
        
        if let image = profileImage {
            saveProfileImage(image)
        }
        
        isEditMode = false
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func loadProfileImage() {
        // Implementation for loading profile image
        // TODO: Add image loading from UserDefaults or FileManager
    }
    
    private func saveProfileImage(_ image: UIImage) {
        // Implementation for saving profile image
        // TODO: Add image saving to UserDefaults or FileManager
    }
    
    func signOut() {
        // TODO: Implement sign out logic
        print("User signed out")
    }
} 