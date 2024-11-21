import SwiftUI

struct DailyMovementView: View {
    @StateObject private var viewModel = ExercisesViewModel()
    @State private var selectedBodyPart: BodyPart?
    @State private var showingExerciseDetail = false
    @State private var selectedExercise: Exercise?
    @State private var completedBodyParts: Set<BodyPart> = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    dailyProgressSection
                    bodyPartsGridSection
                }
                .padding(.top)
            }
            .navigationTitle("Daily Movement")
            .onChange(of: showingExerciseDetail) { isShowing in
                if !isShowing {
                    // Clean up when sheet is dismissed
                    DispatchQueue.main.async {
                        selectedExercise = nil
                        selectedBodyPart = nil
                    }
                }
            }
            .fullScreenCover(item: $selectedExercise) { exercise in
                NavigationView {
                    ExerciseDetailView(exercise: exercise)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(
                            leading: Button("Back") {
                                selectedExercise = nil
                            },
                            trailing: Button("Complete") {
                                handleExerciseCompletion()
                            }
                            .foregroundColor(SuperhumanTheme.primaryColor)
                            .font(.headline)
                        )
                        .navigationBarTitleDisplayMode(.inline)
                }
                .interactiveDismissDisabled()
            }
        }
    }
    
    private var dailyProgressSection: some View {
        VStack(spacing: 16) {
            progressRing
            progressText
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(20)
        .padding(.horizontal)
    }
    
    private var progressRing: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 10)
                .frame(width: 120, height: 120)
            
            Circle()
                .trim(from: 0, to: CGFloat(completedBodyParts.count) / CGFloat(BodyPart.allCases.count))
                .stroke(SuperhumanTheme.primaryColor, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 120, height: 120)
                .rotationEffect(.degrees(-90))
                .animation(.spring(), value: completedBodyParts.count)
            
            VStack {
                Text("\(completedBodyParts.count)/\(BodyPart.allCases.count)")
                    .font(.title2.bold())
                Text("Complete")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private var progressText: some View {
        VStack {
            Text("Daily Movement Challenge")
                .font(.headline)
            
            Text("Complete one exercise for each body part")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
    
    private var bodyPartsGridSection: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
            ForEach(BodyPart.allCases) { bodyPart in
                BodyPartCard(
                    bodyPart: bodyPart,
                    isCompleted: completedBodyParts.contains(bodyPart)
                ) {
                    handleBodyPartSelection(bodyPart)
                }
            }
        }
        .padding(.horizontal)
    }
    
    private func handleBodyPartSelection(_ bodyPart: BodyPart) {
        if let exercise = viewModel.getRandomExercise(for: bodyPart) {
            selectedBodyPart = bodyPart
            selectedExercise = exercise // This will automatically trigger the sheet
        }
    }
    
    private func handleExerciseCompletion() {
        withAnimation(.spring()) {
            if let bodyPart = selectedBodyPart {
                completedBodyParts.insert(bodyPart)
            }
        }
        
        // Debug print
        print("Completing exercise...")
        
        // Post notification for progress tracking
        if let exercise = selectedExercise {
            print("Posting notification for exercise: \(exercise.name)")
            NotificationCenter.default.post(
                name: Notification.Name("exerciseCompleted"), // Use exact string
                object: exercise
            )
        }
        
        selectedExercise = nil
        
        // Save completed body parts
        if let data = try? JSONEncoder().encode(Array(completedBodyParts)) {
            UserDefaults.standard.set(data, forKey: "completedBodyParts")
        }
    }
}

struct BodyPartCard: View {
    let bodyPart: BodyPart
    let isCompleted: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(isCompleted ? SuperhumanTheme.primaryColor : Color.gray.opacity(0.2))
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: iconName(for: bodyPart))
                        .font(.system(size: 24))
                        .foregroundColor(isCompleted ? .black : .white)
                }
                
                Text(bodyPart.rawValue)
                    .font(.subheadline)
                    .foregroundColor(isCompleted ? SuperhumanTheme.primaryColor : .white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(20)
        }
    }
    
    private func iconName(for bodyPart: BodyPart) -> String {
        switch bodyPart {
        case .wrists: return "hand.raised.circle.fill"
        case .neck: return "person.bust.circle.fill"
        case .genitals: return "figure.core.training.circle.fill"
        case .ankles: return "figure.walk.circle.fill"
        case .lowerBack: return "figure.archery.circle.fill"
        case .jaw: return "face.smiling.inverse"
        case .hips: return "figure.mixed.cardio.circle.fill"
        case .shoulders: return "figure.strengthtraining.traditional.circle.fill"
        case .eyes: return "eye.circle.fill"
        }
    }
}

#Preview {
    DailyMovementView()
} 