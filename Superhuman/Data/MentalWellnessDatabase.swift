import Foundation

struct MentalWellnessDatabase {
    static let activities: [MentalWellnessActivity] = [
        // Meditation Activities
        MentalWellnessActivity(
            type: .meditation,
            title: "Mindful Observation",
            description: "Simple meditation focusing on present moment awareness",
            duration: 300,
            steps: [
                "Find a comfortable seated position",
                "Close your eyes or maintain a soft gaze",
                "Focus on your natural breath",
                "Observe thoughts without judgment",
                "Gently return focus to breath when mind wanders"
            ],
            benefits: [
                "Reduces stress and anxiety",
                "Improves focus and concentration",
                "Enhances emotional regulation",
                "Promotes mental clarity"
            ],
            tips: [
                "Start with short sessions",
                "Be patient with wandering thoughts",
                "Practice regularly for best results",
                "Find a quiet, comfortable space"
            ]
        ),
        
        // Breathing Activities
        MentalWellnessActivity(
            type: .breathing,
            title: "4-7-8 Breathing",
            description: "Calming breath technique for relaxation and stress relief",
            duration: 300,
            steps: [
                "Sit comfortably with straight spine",
                "Inhale quietly through nose for 4 counts",
                "Hold breath for 7 counts",
                "Exhale completely through mouth for 8 counts",
                "Repeat cycle 4 times"
            ],
            benefits: [
                "Reduces anxiety",
                "Helps with sleep",
                "Lowers stress levels",
                "Improves focus"
            ],
            tips: [
                "Keep breathing smooth and natural",
                "Don't force the breath",
                "Practice when feeling stressed",
                "Can be done anywhere"
            ]
        ),
        
        // Mindfulness Activities
        MentalWellnessActivity(
            type: .mindfulness,
            title: "Body Scan",
            description: "Progressive relaxation through body awareness",
            duration: 600,
            steps: [
                "Lie down in a comfortable position",
                "Close eyes and focus on breathing",
                "Scan body from toes to head",
                "Notice sensations without judgment",
                "Release tension in each area"
            ],
            benefits: [
                "Reduces physical tension",
                "Improves body awareness",
                "Promotes relaxation",
                "Helps with stress management"
            ],
            tips: [
                "Take your time",
                "Stay present with each body part",
                "Notice but don't try to change",
                "Practice regularly"
            ]
        ),
        
        // Add more activities for each type...
    ]
    
    static func activitiesForType(_ type: MentalWellnessType) -> [MentalWellnessActivity] {
        activities.filter { $0.type == type }
    }
} 