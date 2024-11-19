import Foundation

struct WorkoutProgress: Identifiable, Codable {
    let id: UUID
    let date: Date
    let duration: TimeInterval
    let exercisesCompleted: Int
    let bodyPartsWorked: Set<BodyPart>
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, date, duration, exercisesCompleted, bodyPartsWorked
    }
    
    init(id: UUID = UUID(), date: Date, duration: TimeInterval, exercisesCompleted: Int, bodyPartsWorked: Set<BodyPart>) {
        self.id = id
        self.date = date
        self.duration = duration
        self.exercisesCompleted = exercisesCompleted
        self.bodyPartsWorked = bodyPartsWorked
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        date = try container.decode(Date.self, forKey: .date)
        duration = try container.decode(TimeInterval.self, forKey: .duration)
        exercisesCompleted = try container.decode(Int.self, forKey: .exercisesCompleted)
        let bodyPartArray = try container.decode([BodyPart].self, forKey: .bodyPartsWorked)
        bodyPartsWorked = Set(bodyPartArray)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(date, forKey: .date)
        try container.encode(duration, forKey: .duration)
        try container.encode(exercisesCompleted, forKey: .exercisesCompleted)
        try container.encode(Array(bodyPartsWorked), forKey: .bodyPartsWorked)
    }
} 