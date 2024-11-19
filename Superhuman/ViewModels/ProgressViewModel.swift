import Foundation
import Combine

class ProgressViewModel: ObservableObject {
    @Published var weeklyProgress: [WorkoutProgress] = []
    @Published var selectedTimeFrame: TimeFrame = .week
    @Published var totalMinutesThisWeek: Int = 0
    @Published var streakDays: Int = 0
    @Published var completionRate: Double = 0.0
    
    enum TimeFrame: String, CaseIterable {
        case week = "Week"
        case month = "Month"
        case year = "Year"
    }
    
    init() {
        loadProgress()
    }
    
    private func loadProgress() {
        // TODO: Replace with actual data from persistence
        let calendar = Calendar.current
        let today = Date()
        
        weeklyProgress = (0..<7).map { dayOffset in
            let date = calendar.date(byAdding: .day, value: -dayOffset, to: today)!
            return WorkoutProgress(
                id: UUID(),
                date: date,
                duration: TimeInterval(Int.random(in: 0...45) * 60),
                exercisesCompleted: Int.random(in: 0...5),
                bodyPartsWorked: Set(BodyPart.allCases.prefix(Int.random(in: 1...3)))
            )
        }
        
        updateStats()
    }
    
    private func updateStats() {
        totalMinutesThisWeek = weeklyProgress
            .reduce(0) { $0 + Int($1.duration / 60) }
        
        streakDays = calculateStreakDays()
        completionRate = calculateCompletionRate()
    }
    
    private func calculateStreakDays() -> Int {
        // TODO: Implement actual streak calculation
        return 5
    }
    
    private func calculateCompletionRate() -> Double {
        // TODO: Implement actual completion rate calculation
        return 0.75
    }
} 