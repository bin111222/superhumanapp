import Foundation
import Combine
import UIKit

class ProgressViewModel: ObservableObject {
    @Published var bodyPartProgress: [BodyPart: Double] = [:]
    @Published var mentalWellnessProgress: [MentalWellnessType: Double] = [:]
    @Published var selectedTimeFrame: TimeFrame = .week
    @Published var consistencyScore: Double = 0
    @Published var currentStreak: Int = 0
    
    private var progressData: ProgressData = .empty {
        didSet {
            saveProgress()
            updateCalculatedMetrics()
        }
    }
    
    enum TimeFrame: String, CaseIterable {
        case week = "Week"
        case month = "Month"
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
        let timeFrame = getTimeFrameDates()
        let calendar = Calendar.current
        let now = Date()
        
        // Get all exercises within the time frame
        let recentExercises = progressData.exerciseHistory.filter { 
            $0.completionDate >= timeFrame.start && $0.completionDate <= timeFrame.end 
        }
        
        // Group exercises by date (to count days where exercises were done)
        let exerciseDates = Set(recentExercises.map { 
            calendar.startOfDay(for: $0.completionDate)
        })
        
        // Calculate total possible days
        let totalDays: Double
        switch selectedTimeFrame {
        case .week:
            totalDays = 7
        case .month:
            totalDays = 30
        }
        
        // Calculate progress based on days completed
        let completedDays = Double(exerciseDates.count)
        let progress = completedDays / totalDays
        
        // Update progress for each body part
        BodyPart.allCases.forEach { bodyPart in
            bodyPartProgress[bodyPart] = min(1.0, progress)
        }
    }
    
    private func updateConsistencyScore() {
        let timeFrame = getTimeFrameDates()
        let calendar = Calendar.current
        let totalDays = calendar.dateComponents([.day], from: timeFrame.start, to: timeFrame.end).day ?? 1
        
        let exerciseDays = Set(progressData.exerciseHistory
            .filter { $0.completionDate >= timeFrame.start && $0.completionDate <= timeFrame.end }
            .map { calendar.startOfDay(for: $0.completionDate) }
        ).count
        
        consistencyScore = Double(exerciseDays) / Double(totalDays)
    }
    
    private func getTimeFrameDates() -> (start: Date, end: Date) {
        let calendar = Calendar.current
        let now = Date()
        
        let start: Date
        switch selectedTimeFrame {
        case .week:
            start = calendar.date(byAdding: .day, value: -7, to: now) ?? now
        case .month:
            start = calendar.date(byAdding: .month, value: -1, to: now) ?? now
        }
        
        return (start: start, end: now)
    }
    
    private func saveProgress() {
        if let encoded = try? JSONEncoder().encode(progressData) {
            UserDefaults.standard.set(encoded, forKey: "exerciseProgress")
        }
        UserDefaults.standard.set(mentalWellnessProgress, forKey: "mentalWellnessProgress")
    }
    
    func loadProgress() {
        if let savedData = UserDefaults.standard.data(forKey: "exerciseProgress"),
           let decoded = try? JSONDecoder().decode(ProgressData.self, from: savedData) {
            progressData = decoded
            updateCalculatedMetrics()
        }
        
        if let savedMentalProgress = UserDefaults.standard.dictionary(forKey: "mentalWellnessProgress") as? [String: Double] {
            MentalWellnessType.allCases.forEach { type in
                mentalWellnessProgress[type] = savedMentalProgress[type.rawValue] ?? 0
            }
        }
    }
} 