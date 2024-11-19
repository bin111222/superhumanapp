import Foundation
import Combine

class ExercisesViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var selectedDifficulty: Exercise.Difficulty?
    @Published var selectedBodyPart: BodyPart?
    @Published var searchText: String = ""
    
    var filteredExercises: [Exercise] {
        exercises.filter { exercise in
            var matches = true
            
            if let difficulty = selectedDifficulty {
                matches = matches && exercise.difficulty == difficulty
            }
            
            if let bodyPart = selectedBodyPart {
                matches = matches && exercise.bodyPart == bodyPart
            }
            
            if !searchText.isEmpty {
                matches = matches && (
                    exercise.name.localizedCaseInsensitiveContains(searchText) ||
                    exercise.description.localizedCaseInsensitiveContains(searchText)
                )
            }
            
            return matches
        }
    }
    
    init() {
        loadExercises()
    }
    
    private func loadExercises() {
        // TODO: Replace with actual API call or database fetch
        exercises = [
            Exercise(
                name: "Wrist Flexor Stretch",
                bodyPart: .wrists,
                description: "A gentle stretch for your wrist flexor muscles",
                difficulty: .beginner,
                duration: 180,
                steps: [
                    "Extend your arm forward with palm facing up",
                    "Use other hand to gently pull fingers down and back",
                    "Hold for 15-30 seconds",
                    "Repeat 3 times"
                ],
                benefits: [
                    "Improves wrist flexibility",
                    "Reduces risk of carpal tunnel",
                    "Relieves wrist tension"
                ]
            ),
            // Add more sample exercises here
        ]
    }
} 