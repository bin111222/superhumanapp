import Foundation
import Combine
import UIKit

class ProgressViewModel: ObservableObject {
    @Published var bodyPartProgress: [BodyPart: Double] = [:]
    @Published var mentalWellnessProgress: [MentalWellnessType: Double] = [:]
    @Published var consistencyScore: Double = 0
    @Published var currentStreak: Int = 0
    
    private var progressData: ProgressData = .empty {
        didSet {
            saveProgress()
            updateCalculatedMetrics()
        }
    }
    
    enum MentalWellnessType: String, CaseIterable {
        case meditation = "Meditation"
        case breathing = "Breathing"
        case stressManagement = "Stress"
        case sleep = "Sleep"
        case mood = "Mood"
    }
    
    init() {
        loadProgress()
        setupNotifications()
    }
    
    private func setupNotifications() {
        // Remove any existing observers first
        NotificationCenter.default.removeObserver(self)
        
        // Add observer with debug prints
        NotificationCenter.default.addObserver(
            forName: Notification.Name("exerciseCompleted"),
            object: nil,
            queue: .main
        ) { [weak self] notification in
            print("Received exercise completion notification")
            if let exercise = notification.object as? Exercise {
                print("Exercise received: \(exercise.name)")
                self?.handleExerciseCompletion(exercise)
            }
        }
    }
    
    private func handleExerciseCompletion(_ exercise: Exercise) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        // Check if we already logged an exercise today
        let exercisesToday = progressData.exerciseHistory.filter {
            calendar.isDate(calendar.startOfDay(for: $0.completionDate), inSameDayAs: today)
        }
        
        // Only add to history if it's a new exercise for today
        let progress = ExerciseProgress(
            exerciseId: exercise.name,
            bodyPart: exercise.bodyPart,
            completionDate: Date(),
            duration: exercise.duration
        )
        
        progressData.exerciseHistory.append(progress)
        progressData.totalExercises += 1
        
        // Update streak only once per day
        if exercisesToday.isEmpty {
            updateStreak()
        }
        
        // Update progress
        updateBodyPartProgress()
        
        // Save changes
        saveProgress()
        
        // Force UI update
        DispatchQueue.main.async {
            self.objectWillChange.send()
        }
    }
    
    @objc private func mentalWellnessCompleted(_ notification: Notification) {
        if let category = notification.userInfo?["category"] as? String {
            let type = getMentalWellnessType(from: category)
            let currentProgress = mentalWellnessProgress[type] ?? 0
            mentalWellnessProgress[type] = min(1.0, currentProgress + 0.2) // Increment by 20%
            saveProgress()
        }
    }
    
    private func getMentalWellnessType(from category: String) -> MentalWellnessType {
        switch category {
        case "Meditation":
            return .meditation
        case "Breathing":
            return .breathing
        case "Stress Management":
            return .stressManagement
        case "Sleep":
            return .sleep
        default:
            return .mood
        }
    }
    
    private func updateStreak() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        // Only update streak once per day
        guard let lastDate = progressData.lastExerciseDate else {
            progressData.currentStreak = 1
            progressData.lastExerciseDate = today
            currentStreak = 1
            return
        }
        
        let lastExerciseDay = calendar.startOfDay(for: lastDate)
        
        // If already logged today, don't update streak
        if calendar.isDate(lastExerciseDay, inSameDayAs: today) {
            return
        }
        
        let daysBetween = calendar.dateComponents([.day], from: lastExerciseDay, to: today).day ?? 0
        
        if daysBetween == 1 {
            // Next consecutive day
            progressData.currentStreak += 1
        } else if daysBetween > 1 {
            // Streak broken
            progressData.currentStreak = 1
        }
        // else daysBetween == 0, same day, don't update streak
        
        progressData.lastExerciseDate = today
        currentStreak = progressData.currentStreak
    }
    
    private func updateCalculatedMetrics() {
        updateBodyPartProgress()
        updateConsistencyScore()
    }
    
    private func updateBodyPartProgress() {
        let calendar = Calendar.current
        let now = Date()
        let weekStart = calendar.date(byAdding: .day, value: -6, to: calendar.startOfDay(for: now))!
        
        // Get all exercises within the week
        let recentExercises = progressData.exerciseHistory.filter { 
            $0.completionDate >= weekStart && $0.completionDate <= now 
        }
        
        // Calculate progress for each body part separately
        BodyPart.allCases.forEach { bodyPart in
            // Get exercises for this specific body part
            let bodyPartExercises = recentExercises.filter { $0.bodyPart == bodyPart }
            
            // Get unique days where this body part was exercised
            let exerciseDates = Set(bodyPartExercises.map { 
                calendar.startOfDay(for: $0.completionDate)
            })
            
            // Calculate progress for this body part (7 days for the week)
            let completedDays = Double(exerciseDates.count)
            let progress = completedDays / 7.0
            
            // Update progress for this specific body part
            bodyPartProgress[bodyPart] = min(1.0, progress)
        }
    }
    
    private func updateConsistencyScore() {
        let calendar = Calendar.current
        let now = Date()
        let weekStart = calendar.date(byAdding: .day, value: -6, to: calendar.startOfDay(for: now))!
        
        let exerciseDays = Set(progressData.exerciseHistory
            .filter { $0.completionDate >= weekStart && $0.completionDate <= now }
            .map { calendar.startOfDay(for: $0.completionDate) }
        ).count
        
        consistencyScore = Double(exerciseDays) / 7.0
    }
    
    private func saveProgress() {
        // Save exercise progress
        if let encoded = try? JSONEncoder().encode(progressData) {
            UserDefaults.standard.set(encoded, forKey: "exerciseProgress")
        }
        
        // Convert mental wellness progress to a codable dictionary and encode
        let codableDict = mentalWellnessProgress.mapKeys { $0.rawValue }
        if let encoded = try? JSONEncoder().encode(codableDict) {
            UserDefaults.standard.set(encoded, forKey: "mentalWellnessProgress")
        }
    }
    
    private func loadProgress() {
        // Load exercise progress
        if let savedData = UserDefaults.standard.data(forKey: "exerciseProgress"),
           let decoded = try? JSONDecoder().decode(ProgressData.self, from: savedData) {
            progressData = decoded
            updateCalculatedMetrics()
        }
        
        // Load mental wellness progress
        if let savedData = UserDefaults.standard.data(forKey: "mentalWellnessProgress"),
           let decodedDict = try? JSONDecoder().decode([String: Double].self, from: savedData) {
            // Convert string keys back to enum cases
            mentalWellnessProgress = Dictionary(uniqueKeysWithValues: decodedDict.compactMap { key, value in
                guard let type = MentalWellnessType(rawValue: key) else { return nil }
                return (type, value)
            })
        }
    }
}

extension Dictionary {
    func mapKeys<T>(_ transform: (Key) -> T) -> Dictionary<T, Value> {
        Dictionary<T, Value>(uniqueKeysWithValues: map { (transform($0.key), $0.value) })
    }
}