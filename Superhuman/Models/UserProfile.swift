import Foundation

struct UserProfile: Codable {
    var name: String
    var email: String
    var age: Int
    var height: Double // in centimeters
    var weight: Double // in kilograms
    var fitnessLevel: FitnessLevel
    var notificationsEnabled: Bool
    var preferredWorkoutTime: Date
    
    enum FitnessLevel: String, Codable, CaseIterable {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
    }
} 