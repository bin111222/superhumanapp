import SwiftUI

struct BodyPartDetailView: View {
    let bodyPart: BodyPart
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                Text(bodyPart.description)
                    .font(SuperhumanTheme.bodyFont)
                    .padding()
                
                // Exercise List
                // This is a placeholder - we'll implement the actual exercise list later
                Text("Exercise list coming soon...")
                    .font(SuperhumanTheme.bodyFont)
                    .padding()
            }
        }
        .navigationTitle(bodyPart.rawValue)
    }
} 