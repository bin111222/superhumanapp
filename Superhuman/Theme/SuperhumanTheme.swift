import SwiftUI

enum SuperhumanTheme {
    static let cornerRadius: CGFloat = 15
    static let primaryColor = Color("SuperhumanPrimary")
    
    // Fonts
    static let titleFont = Font.system(.title, design: .rounded).bold()
    static let headlineFont = Font.system(.headline, design: .rounded)
    static let bodyFont = Font.system(.body, design: .rounded)
    static let captionFont = Font.system(.caption, design: .rounded)
}

struct SuperhumanCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(SuperhumanTheme.padding)
            .background(SuperhumanTheme.backgroundColor)
            .cornerRadius(SuperhumanTheme.cornerRadius)
            .shadow(radius: 5)
    }
}

extension View {
    func superhumanCard() -> some View {
        modifier(SuperhumanCard())
    }
} 