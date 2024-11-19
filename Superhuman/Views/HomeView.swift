import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var appSettings: AppSettings
    @State private var dailyQuote: Quote
    @State private var completedBodyParts: Set<BodyPart> = []
    @State private var showingExercise = false
    @State private var selectedExercise: Exercise?
    
    init() {
        // Initialize with a random quote
        _dailyQuote = State(initialValue: Quote.quotes[Calendar.current.component(.day, from: Date()) % Quote.quotes.count])
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Daily Challenge Header
                    challengeHeader
                    
                    // Body Parts Grid
                    bodyPartsGrid
                    
                    // Daily Quote Card
                    QuoteCard(quote: dailyQuote)
                }
                .padding()
            }
            .navigationTitle("Daily Challenge")
            .sheet(isPresented: $showingExercise) {
                if let exercise = selectedExercise {
                    NavigationView {
                        ExerciseDetailView(exercise: exercise)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button("Complete") {
                                        completeExercise(for: exercise.bodyPart)
                                        showingExercise = false
                                    }
                                }
                            }
                    }
                }
            }
        }
    }
    
    private var challengeHeader: some View {
        VStack(spacing: 12) {
            Text("Complete Today's Challenge")
                .font(.title2.bold())
            
            Text("\(completedBodyParts.count)/\(BodyPart.allCases.count) body parts")
                .font(.headline)
                .foregroundColor(.gray)
            
            ProgressBar(progress: Double(completedBodyParts.count) / Double(BodyPart.allCases.count))
                .frame(height: 8)
                .padding(.horizontal)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private var bodyPartsGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
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
    }
    
    private func selectRandomExercise(for bodyPart: BodyPart) {
        let exercises = ExerciseDatabase.exercises.filter { $0.bodyPart == bodyPart }
        selectedExercise = exercises.randomElement()
        showingExercise = true
    }
    
    private func completeExercise(for bodyPart: BodyPart) {
        withAnimation {
            completedBodyParts.insert(bodyPart)
        }
    }
}

// MARK: - Supporting Views
struct BodyPartCard: View {
    let bodyPart: BodyPart
    let isCompleted: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(bodyPart.rawValue)
                    .font(.headline)
                
                Spacer()
                
                if isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            
            bodyPartIcon
                .font(.system(size: 30))
                .foregroundColor(isCompleted ? .gray : SuperhumanTheme.primaryColor)
            
            Text(bodyPart.description)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(2)
        }
        .padding()
        .frame(height: 150)
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
    }
    
    private func iconName(for bodyPart: BodyPart) -> String {
        switch bodyPart {
        case .wrists: return "hand.raised"
        case .neck: return "person.bust"
        case .genitals: return "figure.walk"
        case .ankles: return "figure.walk.motion"
        case .lowerBack: return "figure.walk.arrival"
        case .jaw: return "mouth"
        case .hips: return "figure.walk.departure"
        case .shoulders: return "figure.arms.open"
        case .eyes: return "eye"
        }
    }
}

struct ProgressBar: View {
    let progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                Rectangle()
                    .fill(SuperhumanTheme.primaryColor)
                    .frame(width: geometry.size.width * progress)
            }
        }
        .cornerRadius(4)
    }
}

struct QuoteCard: View {
    let quote: Quote
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "quote.bubble.fill")
                .font(.system(size: 30))
                .foregroundColor(SuperhumanTheme.primaryColor)
            
            Text(quote.text)
                .font(.system(.body, design: .serif))
                .multilineTextAlignment(.center)
                .italic()
                .padding(.horizontal)
            
            Text("— \(quote.author)")
                .font(.system(.subheadline, design: .serif))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: SuperhumanTheme.cornerRadius)
                .fill(Color.white.opacity(0.05))
                .shadow(radius: 5)
        )
        .overlay(
            RoundedRectangle(cornerRadius: SuperhumanTheme.cornerRadius)
                .stroke(SuperhumanTheme.primaryColor.opacity(0.1), lineWidth: 1)
        )
    }
}

#Preview {
    HomeView()
        .environmentObject(AppSettings())
        .preferredColorScheme(.dark)
} 
            
