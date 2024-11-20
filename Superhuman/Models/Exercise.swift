import SwiftUI

struct Exercise: Identifiable, Codable {
    let id: UUID
    let name: String
    let bodyPart: BodyPart
    let description: String
    let difficulty: Difficulty
    let duration: TimeInterval
    let videoURL: URL?
    let steps: [String]
    let benefits: [String]
    var completionDate: Date?
    var completionStreak: Int = 0
    var totalCompletions: Int = 0
    
    var isCompletedToday: Bool {
        guard let date = completionDate else { return false }
        return Calendar.current.isDateInToday(date)
    }
    
    enum Difficulty: String, Codable, CaseIterable {
        case beginner
        case intermediate
        case advanced
        
        var color: Color {
            switch self {
            case .beginner: return .green
            case .intermediate: return .orange
            case .advanced: return .red
            }
        }
        
        private enum CodingKeys: String, CodingKey {
            case rawValue
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            self = Difficulty(rawValue: rawValue) ?? .beginner
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, name, bodyPart, description, difficulty, duration, videoURL, steps, benefits, completionDate, completionStreak, totalCompletions
    }
    
    init(id: UUID = UUID(), name: String, bodyPart: BodyPart, description: String, 
         difficulty: Difficulty, duration: TimeInterval, videoURL: URL? = nil, 
         steps: [String], benefits: [String]) {
        self.id = id
        self.name = name
        self.bodyPart = bodyPart
        self.description = description
        self.difficulty = difficulty
        self.duration = duration
        self.videoURL = videoURL
        self.steps = steps
        self.benefits = benefits
    }
} 