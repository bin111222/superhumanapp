import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let defaults = UserDefaults.standard
    
    // Keys
    private let userProfileKey = "userProfile"
    private let completedExercisesKey = "completedExercises"
    
    // MARK: - User Profile
    func saveUserProfile(_ profile: UserProfile) {
        if let encoded = try? JSONEncoder().encode(profile) {
            defaults.set(encoded, forKey: userProfileKey)
        }
    }
    
    func loadUserProfile() -> UserProfile? {
        guard let data = defaults.data(forKey: userProfileKey),
              let profile = try? JSONDecoder().decode(UserProfile.self, from: data) else {
            return nil
        }
        return profile
    }
    
    // MARK: - Completed Exercises
    func saveCompletedExercise(_ exercise: Exercise) {
        var completedExercises = loadCompletedExercises()
        var exerciseWithDate = exercise
        exerciseWithDate.completionDate = Date()
        completedExercises.append(exerciseWithDate)
        
        if let encoded = try? JSONEncoder().encode(completedExercises) {
            defaults.set(encoded, forKey: completedExercisesKey)
        }
    }
    
    func loadCompletedExercises() -> [Exercise] {
        guard let data = defaults.data(forKey: completedExercisesKey),
              let exercises = try? JSONDecoder().decode([Exercise].self, from: data) else {
            return []
        }
        return exercises
    }
    
    func clearCompletedExercises() {
        defaults.removeObject(forKey: completedExercisesKey)
    }
} 