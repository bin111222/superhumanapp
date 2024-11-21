import Foundation

struct ExerciseProgress: Codable {
    let exerciseId: String
    let bodyPart: BodyPart
    let completionDate: Date
    let duration: TimeInterval
    
    enum CodingKeys: String, CodingKey {
        case exerciseId
        case bodyPart
        case completionDate
        case duration
    }
    
    init(exerciseId: String, bodyPart: BodyPart, completionDate: Date, duration: TimeInterval) {
        self.exerciseId = exerciseId
        self.bodyPart = bodyPart
        self.completionDate = completionDate
        self.duration = duration
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        exerciseId = try container.decode(String.self, forKey: .exerciseId)
        bodyPart = try container.decode(BodyPart.self, forKey: .bodyPart)
        completionDate = try container.decode(Date.self, forKey: .completionDate)
        duration = try container.decode(TimeInterval.self, forKey: .duration)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(exerciseId, forKey: .exerciseId)
        try container.encode(bodyPart, forKey: .bodyPart)
        try container.encode(completionDate, forKey: .completionDate)
        try container.encode(duration, forKey: .duration)
    }
}

struct ProgressData: Codable {
    var exerciseHistory: [ExerciseProgress]
    var lastExerciseDate: Date?
    var currentStreak: Int
    var totalExercises: Int
    
    enum CodingKeys: String, CodingKey {
        case exerciseHistory
        case lastExerciseDate
        case currentStreak
        case totalExercises
    }
    
    init(exerciseHistory: [ExerciseProgress], lastExerciseDate: Date?, currentStreak: Int, totalExercises: Int) {
        self.exerciseHistory = exerciseHistory
        self.lastExerciseDate = lastExerciseDate
        self.currentStreak = currentStreak
        self.totalExercises = totalExercises
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        exerciseHistory = try container.decode([ExerciseProgress].self, forKey: .exerciseHistory)
        lastExerciseDate = try container.decodeIfPresent(Date.self, forKey: .lastExerciseDate)
        currentStreak = try container.decode(Int.self, forKey: .currentStreak)
        totalExercises = try container.decode(Int.self, forKey: .totalExercises)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(exerciseHistory, forKey: .exerciseHistory)
        try container.encodeIfPresent(lastExerciseDate, forKey: .lastExerciseDate)
        try container.encode(currentStreak, forKey: .currentStreak)
        try container.encode(totalExercises, forKey: .totalExercises)
    }
    
    static var empty: ProgressData {
        ProgressData(exerciseHistory: [], lastExerciseDate: nil, currentStreak: 0, totalExercises: 0)
    }
} 