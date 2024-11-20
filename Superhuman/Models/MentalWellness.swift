import Foundation
import SwiftUI

enum MentalWellnessType: String, CaseIterable, Identifiable {
    case meditation = "Meditation"
    case breathing = "Breathing"
    case mindfulness = "Mindfulness"
    case relaxation = "Relaxation"
    case visualization = "Visualization"
    case gratitude = "Gratitude"
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .meditation: return "brain.head.profile"
        case .breathing: return "lungs.fill"
        case .mindfulness: return "leaf.fill"
        case .relaxation: return "sparkles"
        case .visualization: return "eye.fill"
        case .gratitude: return "heart.fill"
        }
    }
    
    var color: [Color] {
        switch self {
        case .meditation: return [.purple, .blue]
        case .breathing: return [.blue, .cyan]
        case .mindfulness: return [.green, .mint]
        case .relaxation: return [.indigo, .purple]
        case .visualization: return [.orange, .yellow]
        case .gratitude: return [.pink, .red]
        }
    }
}

struct MentalWellnessActivity: Identifiable {
    var id = UUID()
    let type: MentalWellnessType
    let title: String
    let description: String
    let duration: TimeInterval
    let videoURL: URL?
    let steps: [String]
    let benefits: [String]
    let tips: [String]
    
    init(type: MentalWellnessType, 
         title: String, 
         description: String, 
         duration: TimeInterval, 
         steps: [String], 
         benefits: [String], 
         tips: [String],
         videoURL: URL? = nil) {
        self.id = UUID()
        self.type = type
        self.title = title
        self.description = description
        self.duration = duration
        self.steps = steps
        self.benefits = benefits
        self.tips = tips
        self.videoURL = videoURL
    }
    
    var formattedDuration: String {
        let minutes = Int(duration) / 60
        return "\(minutes) min"
    }
} 
