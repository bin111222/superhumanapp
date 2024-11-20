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
    
    func getRandomExercise(for bodyPart: BodyPart) -> Exercise? {
        let exercisesForBodyPart = exercises.filter { $0.bodyPart == bodyPart }
        return exercisesForBodyPart.randomElement()
    }
    
    func exercisesForBodyPart(_ bodyPart: BodyPart) -> [Exercise] {
        exercises.filter { $0.bodyPart == bodyPart }
    }
} 