import SwiftUI

struct DailyMovementView: View {
    @StateObject private var viewModel = ExercisesViewModel()
    @State private var selectedBodyPart: BodyPart?
    @State private var showingExerciseDetail = false
    @State private var selectedExercise: Exercise?
    @State private var completedBodyParts: Set<BodyPart> = [] {
        didSet {
            // Save to UserDefaults when the set changes
            if let encoded = try? JSONEncoder().encode(completedBodyParts) {
                UserDefaults.standard.set(encoded, forKey: "completedBodyParts")
                UserDefaults.standard.set(Date(), forKey: "lastCompletionDate")
            }
        }
    }
    
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
            .onAppear(perform: loadCompletedBodyParts)
            .onChange(of: showingExerciseDetail) { _, isShowing in
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
                                if let bodyPart = selectedBodyPart {
                                    completedBodyParts.insert(bodyPart)
                                    
                                    // Post notification for progress tracking
                                    NotificationCenter.default.post(
                                        name: Notification.Name("exerciseCompleted"),
                                        object: selectedExercise
                                    )
                                }
                                selectedExercise = nil
                                showingExerciseDetail = false
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
                )
                .onTapGesture {
                    selectedBodyPart = bodyPart
                    showingExerciseDetail = true
                    selectedExercise = viewModel.getRandomExercise(for: bodyPart)
                }
            }
        }
        .padding()
    }
    
    private func loadCompletedBodyParts() {
        if let savedData = UserDefaults.standard.data(forKey: "completedBodyParts"),
           let decoded = try? JSONDecoder().decode(Set<BodyPart>.self, from: savedData) {
            if let lastCompletionDate = UserDefaults.standard.object(forKey: "lastCompletionDate") as? Date,
               !Calendar.current.isDateInToday(lastCompletionDate) {
                // Reset if it's a new day
                completedBodyParts = []
            } else {
                completedBodyParts = decoded
            }
        }
    }
}

struct BodyPartCard: View {
    let bodyPart: BodyPart
    let isCompleted: Bool
    
    var body: some View {
        VStack {
            Image(systemName: bodyPart.iconName)
                .font(.system(size: 30))
                .foregroundColor(isCompleted ? .green : .white)
            
            Text(bodyPart.rawValue)
                .font(.headline)
                .foregroundColor(isCompleted ? .green : .white)
        }
        .frame(maxWidth: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isCompleted ? Color.green : Color.clear, lineWidth: 2)
        )
    }
}

#Preview {
    DailyMovementView()
}
