import SwiftUI

struct ExercisesView: View {
    @StateObject private var viewModel = ExercisesViewModel()
    @State private var showingFilters = false
    @State private var searchText = ""
    @State private var selectedBodyPart: BodyPart?
    @State private var selectedDifficulty: Exercise.Difficulty?
    @State private var showingExerciseDetail = false
    @State private var selectedExercise: Exercise?
    
    private var filteredExercises: [Exercise] {
        var exercises = ExerciseDatabase.exercises
        
        // Apply search filter
        if !searchText.isEmpty {
            exercises = exercises.filter { exercise in
                exercise.name.localizedCaseInsensitiveContains(searchText) ||
                exercise.description.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // Apply body part filter
        if let bodyPart = selectedBodyPart {
            exercises = exercises.filter { $0.bodyPart == bodyPart }
        }
        
        // Apply difficulty filter
        if let difficulty = selectedDifficulty {
            exercises = exercises.filter { $0.difficulty == difficulty }
        }
        
        return exercises
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search and Filter Bar
                searchFilterBar
                
                // Active Filters
                if selectedBodyPart != nil || selectedDifficulty != nil {
                    activeFilters
                }
                
                // Exercise List
                exerciseList
            }
            .navigationTitle("Exercises")
            .sheet(isPresented: $showingFilters) {
                FilterSheet(
                    selectedBodyPart: $selectedBodyPart,
                    selectedDifficulty: $selectedDifficulty
                )
            }
            .fullScreenCover(item: $selectedExercise) { exercise in
                NavigationView {
                    ExerciseDetailView(exercise: exercise)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(
                            leading: Button {
                                selectedExercise = nil
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: "chevron.left")
                                    Text("Back")
                                }
                                .foregroundColor(SuperhumanTheme.primaryColor)
                            },
                            trailing: Button("Complete") {
                                handleExerciseCompletion(exercise)
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
    
    private func handleExerciseCompletion(_ exercise: Exercise) {
        // Post notification for progress tracking
        NotificationCenter.default.post(
            name: NSNotification.Name("ExerciseCompleted"),
            object: exercise
        )
        
        // Dismiss the detail view
        selectedExercise = nil
    }
    
    private var searchFilterBar: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search exercises", text: $searchText)
            }
            .padding(8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            
            Button(action: { showingFilters = true }) {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundColor(SuperhumanTheme.primaryColor)
                    .font(.title2)
            }
        }
        .padding()
    }
    
    private var activeFilters: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                if let bodyPart = selectedBodyPart {
                    FilterChip(text: bodyPart.rawValue) {
                        selectedBodyPart = nil
                    }
                }
                
                if let difficulty = selectedDifficulty {
                    FilterChip(text: difficulty.rawValue.capitalized) {
                        selectedDifficulty = nil
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var exerciseList: some View {
        List {
            ForEach(BodyPart.allCases) { bodyPart in
                if let exercises = exercisesGroupedByBodyPart[bodyPart], !exercises.isEmpty {
                    Section(header: Text(bodyPart.rawValue)) {
                        ForEach(exercises) { exercise in
                            ExerciseRow(exercise: exercise)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedExercise = exercise
                                }
                        }
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var exercisesGroupedByBodyPart: [BodyPart: [Exercise]] {
        Dictionary(grouping: filteredExercises) { $0.bodyPart }
    }
}

// MARK: - Supporting Views
private struct FilterChip: View {
    let text: String
    let onRemove: () -> Void
    
    var body: some View {
        HStack {
            Text(text)
            Button(action: onRemove) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
    }
}

private struct ExerciseRow: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(exercise.name)
                    .font(SuperhumanTheme.headlineFont)
                Spacer()
                Text(exercise.difficulty.rawValue.capitalized)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(exercise.difficulty.color.opacity(0.2))
                    .foregroundColor(exercise.difficulty.color)
                    .cornerRadius(8)
            }
            
            Text(exercise.description)
                .font(SuperhumanTheme.bodyFont)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            HStack {
                Image(systemName: "clock")
                Text("\(Int(exercise.duration/60)) min")
                Spacer()
                Text(exercise.bodyPart.rawValue)
                    .foregroundColor(.gray)
            }
            .font(.caption)
        }
        .padding(.vertical, 8)
    }
}

struct FilterSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedBodyPart: BodyPart?
    @Binding var selectedDifficulty: Exercise.Difficulty?
    
    var body: some View {
        NavigationView {
            Form {
                Section("Body Part") {
                    ForEach(BodyPart.allCases) { bodyPart in
                        Button(action: {
                            selectedBodyPart = bodyPart
                            dismiss()
                        }) {
                            HStack {
                                Text(bodyPart.rawValue)
                                Spacer()
                                if selectedBodyPart == bodyPart {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(SuperhumanTheme.primaryColor)
                                }
                            }
                        }
                    }
                }
                
                Section("Difficulty") {
                    ForEach(Exercise.Difficulty.allCases, id: \.self) { difficulty in
                        Button(action: {
                            selectedDifficulty = difficulty
                            dismiss()
                        }) {
                            HStack {
                                Text(difficulty.rawValue.capitalized)
                                Spacer()
                                if selectedDifficulty == difficulty {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(SuperhumanTheme.primaryColor)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Filters")
            .navigationBarItems(trailing: Button("Done") { dismiss() })
        }
    }
}

#Preview {
    ExercisesView()
} 