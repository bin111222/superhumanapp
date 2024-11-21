import SwiftUI
import UserNotifications

class ProfileViewModel: ObservableObject {
    @Published var profile: UserProfile
    @Published var isEditMode = false
    @Published var editableProfile: UserProfile
    @Published var showNotificationAlert = false
    @Published var notificationAlertType: NotificationAlertType = .request
    
    // Validation states
    @Published var nameError: String?
    @Published var emailError: String?
    @Published var ageError: String?
    
    enum NotificationAlertType {
        case request
        case denied
        case settings
    }
    
    init() {
        // Load saved profile or use default
        if let savedProfile = UserDefaultsManager.shared.loadUserProfile() {
            self.profile = savedProfile
            self.editableProfile = savedProfile
        } else {
            let defaultProfile = UserProfile(
                name: "",
                email: "",
                age: 25,
                height: 170,
                weight: 70,
                fitnessLevel: .beginner,
                notificationsEnabled: false,
                preferredWorkoutTime: Date()
            )
            self.profile = defaultProfile
            self.editableProfile = defaultProfile
        }
    }
    
    func updateProfile() {
        guard validateProfile() else { return }
        profile = editableProfile
        UserDefaultsManager.shared.saveUserProfile(profile)
        isEditMode = false
    }
    
    private func validateProfile() -> Bool {
        var isValid = true
        
        // Reset errors
        nameError = nil
        emailError = nil
        ageError = nil
        
        // Validate name
        if editableProfile.name.trimmingCharacters(in: .whitespaces).isEmpty {
            nameError = "Name is required"
            isValid = false
        }
        
        // Validate email
        if !isValidEmail(editableProfile.email) {
            emailError = "Please enter a valid email"
            isValid = false
        }
        
        // Validate age
        if editableProfile.age < 18 || editableProfile.age > 100 {
            ageError = "Age must be between 18 and 100"
            isValid = false
        }
        
        return isValid
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func toggleNotifications() {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            DispatchQueue.main.async {
                switch settings.authorizationStatus {
                case .notDetermined:
                    self?.requestNotificationPermission()
                case .denied:
                    self?.notificationAlertType = .denied
                    self?.showNotificationAlert = true
                case .authorized:
                    self?.editableProfile.notificationsEnabled.toggle()
                    self?.updateProfile()
                default:
                    break
                }
            }
        }
    }
    
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, _ in
            DispatchQueue.main.async {
                if granted {
                    self?.editableProfile.notificationsEnabled = true
                    self?.updateProfile()
                } else {
                    self?.editableProfile.notificationsEnabled = false
                    self?.notificationAlertType = .denied
                    self?.showNotificationAlert = true
                }
            }
        }
    }
} 