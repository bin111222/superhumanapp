import Foundation

enum BodyPart: String, Codable, CaseIterable, Identifiable {
    case wrists = "Wrists"
    case neck = "Neck"
    case genitals = "Pelvic Floor"
    case ankles = "Ankles"
    case lowerBack = "Lower Back"
    case jaw = "Jaw"
    case hips = "Hips"
    case shoulders = "Shoulders"
    case eyes = "Eyes"
    
    var id: String { rawValue }
    
    var iconName: String {
        switch self {
        case .wrists:
            return "hand.raised"
        case .neck:
            return "person.bust"
        case .genitals:
            return "figure.stand"
        case .ankles:
            return "figure.walk"
        case .lowerBack:
            return "figure.arms.open"
        case .jaw:
            return "mouth"
        case .hips:
            return "figure.stand"
        case .shoulders:
            return "person.fill"
        case .eyes:
            return "eye"
        }
    }
    
    var description: String {
        switch self {
        case .wrists:
            return "Flexibility and strength training for wrists"
        case .neck:
            return "Stretching routines and posture correction"
        case .genitals:
            return "Pelvic floor strengthening exercises"
        case .ankles:
            return "Mobility drills and balance training"
        case .lowerBack:
            return "Exercises for back health and sciatica relief"
        case .jaw:
            return "TMJ relief and relaxation techniques"
        case .hips:
            return "Glute activation and hip flexor strengthening"
        case .shoulders:
            return "Rotator cuff exercises and stability training"
        case .eyes:
            return "Eye exercises for improved vision and relaxation"
        }
    }
} 
