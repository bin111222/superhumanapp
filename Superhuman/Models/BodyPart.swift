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
        case .eyes:
            return "Improves vision over time"
        case .hips:
            return "Glute activation and hip flexor strengthening"
        case .shoulders:
            return "Rotator cuff exercises and stability training"
        }
    }
} 