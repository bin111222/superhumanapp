import Foundation
import Combine

class ProgressViewModel: ObservableObject {
    @Published var completedExercises: [Exercise] = []
    @Published var timeUntilReset: String = ""
    @Published var todayProgress: Double = 0.0
    @Published var weeklyProgress: Double = 0.0
    private var timer: Timer?
    
    // Constants for goals
    private let totalDailyGoal = BodyPart.allCases.count
    private let totalWeeklyGoal = BodyPart.allCases.count * 7
    
    init() {
        loadCompletedExercises()
        startResetTimer()
        calculateProgress()
        
        // Add notification observer for exercise completion
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(exerciseCompleted),
            name: NSNotification.Name("ExerciseCompleted"),
            object: nil
        )
    }
    
    func hasExercises(on date: Date) -> Bool {
        let calendar = Calendar.current
        return completedExercises.contains { exercise in
            guard let completionDate = exercise.completionDate else { return false }
            return calendar.isDate(date, inSameDayAs: completionDate)
        }
    }
    
    private func loadCompletedExercises() {
        completedExercises = UserDefaultsManager.shared.loadCompletedExercises()
        calculateProgress()
    }
    
    @objc private func exerciseCompleted(notification: Notification) {
        if let exercise = notification.object as? Exercise {
            completedExercises.append(exercise)
            UserDefaultsManager.shared.saveCompletedExercise(exercise)
            calculateProgress()
        }
    }
    
    private func calculateProgress() {
        // Calculate today's progress (out of total body parts)
        let todayExercises = completedExercises.filter { exercise in
            Calendar.current.isDateInToday(exercise.completionDate ?? Date())
        }
        
        // Count unique body parts completed today
        let uniqueBodyPartsToday = Set(todayExercises.map { $0.bodyPart })
        todayProgress = Double(uniqueBodyPartsToday.count) / Double(totalDailyGoal)
        
        // Calculate weekly progress (out of body parts * 7 days)
        let calendar = Calendar.current
        let weekStart = calendar.startOfWeek(for: Date())
        let weekEnd = calendar.date(byAdding: .day, value: 7, to: weekStart)!
        
        let weekExercises = completedExercises.filter { exercise in
            guard let date = exercise.completionDate else { return false }
            return date >= weekStart && date < weekEnd
        }
        
        // Count total completed exercises this week
        weeklyProgress = Double(weekExercises.count) / Double(totalWeeklyGoal)
    }
    
    private func startResetTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTimeUntilReset()
        }
    }
    
    private func updateTimeUntilReset() {
        let calendar = Calendar.current
        let now = Date()
        
        // Find next Monday at midnight
        var components = DateComponents()
        components.weekday = 2 // Monday
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        guard let nextReset = calendar.nextDate(after: now,
                                              matching: components,
                                              matchingPolicy: .nextTime) else {
            return
        }
        
        let difference = calendar.dateComponents([.day, .hour, .minute, .second], from: now, to: nextReset)
        
        timeUntilReset = String(format: "%dd %02dh %02dm",
                               difference.day ?? 0,
                               difference.hour ?? 0,
                               difference.minute ?? 0)
    }
    
    deinit {
        timer?.invalidate()
    }
}

// Helper extension for Calendar
extension Calendar {
    func startOfWeek(for date: Date) -> Date {
        let components = self.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        return self.date(from: components)!
    }
} 