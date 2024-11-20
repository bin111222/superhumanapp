import SwiftUI

// Shared Components
struct TabButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(text)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .bold : .regular)
                    .foregroundColor(isSelected ? .white : .gray)
                
                Rectangle()
                    .fill(isSelected ? SuperhumanTheme.primaryColor : Color.clear)
                    .frame(height: 2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct StatBadge: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .foregroundColor(SuperhumanTheme.primaryColor)
            Text(text)
                .font(.subheadline)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

struct BenefitsView: View {
    let benefits: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(benefits, id: \.self) { benefit in
                HStack(spacing: 12) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(SuperhumanTheme.primaryColor)
                    Text(benefit)
                }
            }
        }
    }
}

struct TipsView: View {
    let tips: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(tips, id: \.self) { tip in
                HStack(spacing: 12) {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(.yellow)
                    Text(tip)
                }
            }
        }
    }
} 