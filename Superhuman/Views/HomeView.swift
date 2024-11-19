import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appSettings: AppSettings
    @State private var dailyQuote: Quote
    @State private var completedBodyParts: Set<BodyPart> = []
    @State private var selectedExercise: Exercise?
    
    init() {
        // Initialize with a random quote
        _dailyQuote = State(initialValue: Quote.quotes[Calendar.current.component(.day, from: Date()) % Quote.quotes.count])
    }
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    // Challenge Header
                    VStack(spacing: 8) {
                        Text("Complete Today's Movements")
                            .font(.system(.title2, design: .rounded).bold())
                            .frame(maxWidth: .infinity)
                        
                        Text("\(completedBodyParts.count)/\(BodyPart.allCases.count) body parts")
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.gray)
                        
                        // Animated Progress Bar
                        FluidProgressBar(progress: Double(completedBodyParts.count) / Double(BodyPart.allCases.count))
                            .frame(height: 12)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(16)
                    
                    // Body Parts Grid
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 12) {
                        ForEach(BodyPart.allCases) { bodyPart in
                            BodyPartCard(
                                bodyPart: bodyPart,
                                isCompleted: completedBodyParts.contains(bodyPart)
                            )
                            .onTapGesture {
                                if !completedBodyParts.contains(bodyPart) {
                                    selectRandomExercise(for: bodyPart)
                                }
                            }
                        }
                    }
                    
                    // Daily Quote Card
                    QuoteCard(quote: dailyQuote)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            .navigationTitle("Daily Movement Challenge")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $selectedExercise) { exercise in
                NavigationView {
                    ExerciseDetailView(exercise: exercise)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Complete") {
                                    completeExercise(for: exercise.bodyPart)
                                    selectedExercise = nil
                                }
                            }
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Close") {
                                    selectedExercise = nil
                                }
                            }
                        }
                }
            }
        }
    }
    
    private func selectRandomExercise(for bodyPart: BodyPart) {
        let exercises = ExerciseDatabase.exercises.filter { $0.bodyPart == bodyPart }
        if let randomExercise = exercises.randomElement() {
            selectedExercise = randomExercise
        }
    }
    
    private func completeExercise(for bodyPart: BodyPart) {
        withAnimation {
            completedBodyParts.insert(bodyPart)
            if let exercise = selectedExercise {
                NotificationCenter.default.post(
                    name: NSNotification.Name("ExerciseCompleted"),
                    object: exercise
                )
            }
        }
    }
}

// MARK: - Supporting Views
struct FluidProgressBar: View {
    let progress: Double
    @State private var phase = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.3))
                
                // Animated Progress
                RoundedRectangle(cornerRadius: 6)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                SuperhumanTheme.primaryColor,
                                SuperhumanTheme.primaryColor.opacity(0.7),
                                SuperhumanTheme.primaryColor
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: geometry.size.width * progress)
                    .overlay(
                        Wave(phase: phase, width: geometry.size.width * progress)
                            .fill(Color.white.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    )
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                phase = .pi * 2
            }
        }
    }
}

struct Wave: Shape {
    var phase: Double
    var width: Double
    var amplitude: CGFloat = 5
    var frequency: CGFloat = 10
    
    var animatableData: Double {
        get { phase }
        set { phase = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        let midHeight = height / 2
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / width
            let sine = sin(relativeX * frequency + phase)
            let y = midHeight + sine * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()
        
        return path
    }
}

struct BodyPartCard: View {
    let bodyPart: BodyPart
    let isCompleted: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(bodyPart.rawValue)
                    .font(.system(.headline, design: .rounded))
                
                Spacer()
                
                if isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            
            bodyPartIcon
                .font(.system(size: 32))
                .foregroundColor(isCompleted ? .gray : iconColor)
            
            Text(bodyPart.description)
                .font(.system(.caption, design: .rounded))
                .foregroundColor(.gray)
                .lineLimit(2)
        }
        .padding(12)
        .frame(height: 130)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(
                            isCompleted ? Color.green.opacity(0.3) : Color.clear,
                            lineWidth: 2
                        )
                )
        )
        .opacity(isCompleted ? 0.7 : 1)
    }
    
    private var bodyPartIcon: some View {
        Image(systemName: iconName(for: bodyPart))
            .symbolRenderingMode(.palette)
            .foregroundStyle(iconColor, iconSecondaryColor)
    }
    
    private var iconColor: Color {
        switch bodyPart {
        case .wrists: return .blue
        case .neck: return .purple
        case .genitals: return .pink
        case .ankles: return .green
        case .lowerBack: return .orange
        case .jaw: return .red
        case .hips: return .yellow
        case .shoulders: return .mint
        case .eyes: return .indigo
        }
    }
    
    private var iconSecondaryColor: Color {
        iconColor.opacity(0.3)
    }
    
    private func iconName(for bodyPart: BodyPart) -> String {
        switch bodyPart {
        case .wrists: return "hand.raised.fill"
        case .neck: return "person.bust.fill"
        case .genitals: return "figure.walk.motion"
        case .ankles: return "figure.walk.circle.fill"
        case .lowerBack: return "figure.walk.arrival.fill"
        case .jaw: return "mouth.fill"
        case .hips: return "figure.dance"
        case .shoulders: return "figure.arms.open"
        case .eyes: return "eye.fill"
        }
    }
}

struct QuoteCard: View {
    let quote: Quote
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "quote.bubble.fill")
                .font(.system(size: 32))
                .foregroundStyle(
                    LinearGradient(
                        colors: [SuperhumanTheme.primaryColor, SuperhumanTheme.primaryColor.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text(quote.text)
                .font(.system(.body, design: .serif, weight: .medium))
                .italic()
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.white)
            
            Text("— \(quote.author)")
                .font(.system(.subheadline, design: .serif, weight: .light))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: SuperhumanTheme.cornerRadius)
                .fill(Color.white.opacity(0.05))
                .shadow(radius: 5)
        )
        .overlay(
            RoundedRectangle(cornerRadius: SuperhumanTheme.cornerRadius)
                .stroke(
                    LinearGradient(
                        colors: [
                            SuperhumanTheme.primaryColor.opacity(0.5),
                            SuperhumanTheme.primaryColor.opacity(0.1)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
        )
    }
}

#Preview {
    HomeView()
        .environmentObject(AppSettings())
        .preferredColorScheme(.dark)
} 
            
