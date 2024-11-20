import Foundation
import Combine

class ExercisesViewModel: ObservableObject {
    @Published var exercises: [Exercise] = ExerciseDatabase.exercises
    @Published var selectedBodyPart: BodyPart?
    @Published var selectedDifficulty: Exercise.Difficulty?
    @Published var searchText = ""
    
    var filteredExercises: [Exercise] {
        var filtered = exercises
        
        if let bodyPart = selectedBodyPart {
            filtered = filtered.filter { $0.bodyPart == bodyPart }
        }
        
        if let difficulty = selectedDifficulty {
            filtered = filtered.filter { $0.difficulty == difficulty }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { exercise in
                exercise.name.localizedCaseInsensitiveContains(searchText) ||
                exercise.description.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return filtered
    }
    
    func getRandomExercise(for bodyPart: BodyPart, excluding current: Exercise? = nil) -> Exercise? {
        var availableExercises = exercises.filter { $0.bodyPart == bodyPart }
        
        // Remove current exercise from possible selections
        if let current = current {
            availableExercises.removeAll { $0.id == current.id }
        }
        
        return availableExercises.randomElement()
    }
    
    func exercisesForBodyPart(_ bodyPart: BodyPart) -> [Exercise] {
        exercises.filter { $0.bodyPart == bodyPart }
    }
} 