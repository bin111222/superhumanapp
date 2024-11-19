import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var showUserDetails = false
    @Published var name = ""
    @Published var ageText = ""
    @Published var heightText = ""
    @Published var weightText = ""
    @Published var heightValue: Double = 170 // Default height in cm
    @Published var weightValue: Double = 70  // Default weight in kg
    @Published var fitnessLevel: UserProfile.FitnessLevel = .beginner
    
    var isValidForm: Bool {
        !name.isEmpty &&
        !ageText.isEmpty &&
        validateAge(ageText)
    }
    
    func calculateBMI() -> Double? {
        let heightInMeters = heightValue / 100
        return weightValue / (heightInMeters * heightInMeters)
    }
    
    func completeOnboarding() {
        let profile = UserProfile(
            name: self.name,
            email: "",
            age: Int(self.ageText) ?? 0,
            height: self.heightValue,
            weight: self.weightValue,
            fitnessLevel: self.fitnessLevel,
            notificationsEnabled: false,
            preferredWorkoutTime: Date()
        )
        
        // Save profile to UserDefaults
        UserDefaultsManager.shared.saveUserProfile(profile)
        
        // Set onboarding as completed
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
    }
    
    // Helper method to update height from slider
    func updateHeight(_ value: Double) {
        heightValue = value
        heightText = String(Int(value))
    }
    
    // Helper method to update weight from slider
    func updateWeight(_ value: Double) {
        weightValue = value
        weightText = String(format: "%.1f", value)
    }
    
    // Helper method to validate age input
    func validateAge(_ text: String) -> Bool {
        guard let age = Int(text) else { return false }
        return age >= 13 && age <= 100
    }
} 