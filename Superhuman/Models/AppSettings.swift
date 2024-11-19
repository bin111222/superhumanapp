import Foundation

class AppSettings: ObservableObject {
    @Published var isDarkModeEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isDarkModeEnabled, forKey: "isDarkModeEnabled")
        }
    }
    
    @Published var selectedBodyPart: BodyPart? {
        didSet {
            if let bodyPart = selectedBodyPart {
                UserDefaults.standard.set(bodyPart.rawValue, forKey: "selectedBodyPart")
            }
        }
    }
    
    init() {
        self.isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
        if let savedBodyPart = UserDefaults.standard.string(forKey: "selectedBodyPart"),
           let bodyPart = BodyPart(rawValue: savedBodyPart) {
            self.selectedBodyPart = bodyPart
        } else {
            self.selectedBodyPart = nil
        }
    }
} 