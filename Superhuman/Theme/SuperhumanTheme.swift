import SwiftUI

enum SuperhumanTheme {
    static let primaryColor = Color("PrimaryColor")
    static let secondaryColor = Color("SecondaryColor")
    static let backgroundColor = Color("BackgroundColor")
    static let textColor = Color("TextColor")
    
    static let padding: CGFloat = 16
    static let cornerRadius: CGFloat = 12
    
    static let titleFont = Font.system(.title, design: .rounded).weight(.bold)
    static let headlineFont = Font.system(.headline, design: .rounded)
    static let bodyFont = Font.system(.body, design: .rounded)
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