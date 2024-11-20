import Foundation
import Combine

class MentalWellnessViewModel: ObservableObject {
    @Published var activities: [MentalWellnessActivity] = MentalWellnessDatabase.activities
    @Published var selectedType: MentalWellnessType?
    @Published var searchText = ""
    
    var filteredActivities: [MentalWellnessActivity] {
        var filtered = activities
        
        if let type = selectedType {
            filtered = filtered.filter { $0.type == type }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { activity in
                activity.title.localizedCaseInsensitiveContains(searchText) ||
                activity.description.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return filtered
    }
    
    func getRandomActivity(for type: MentalWellnessType, excluding current: MentalWellnessActivity? = nil) -> MentalWellnessActivity? {
        var availableActivities = activities.filter { $0.type == type }
        
        if let current = current {
            availableActivities.removeAll { $0.id == current.id }
        }
        
        return availableActivities.randomElement()
    }
    
    func activitiesForType(_ type: MentalWellnessType) -> [MentalWellnessActivity] {
        activities.filter { $0.type == type }
    }
    
    func handleActivityCompletion(_ activity: MentalWellnessActivity) {
        NotificationCenter.default.post(
            name: NSNotification.Name("MentalWellnessActivityCompleted"),
            object: activity
        )
    }
} 