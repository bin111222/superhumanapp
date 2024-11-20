import SwiftUI
import Charts

struct ProgressView: View {
    @StateObject private var viewModel = ProgressViewModel()
    
    // Get current week dates
    private let weekDates: [Date] = {
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        let weekStart = calendar.date(byAdding: .day, value: 2-weekday, to: today)!
        return (0..<7).map { day in
            calendar.date(byAdding: .day, value: day, to: weekStart)!
        }
    }()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Weekly Progress Header
                    weeklyProgressHeader
                    
                    // Calendar Week View
                    weekCalendarView
                    
                    // Completed Exercises Grid
                    if !viewModel.completedExercises.isEmpty {
                        completedExercisesGrid
                    } else {
                        emptyStateView
                    }
                }
                .padding()
            }
            .navigationTitle("This Week")
        }
    }
    
    private var weeklyProgressHeader: some View {
        VStack(spacing: 16) {
            // Today's Progress
            VStack(spacing: 8) {
                HStack {
                    Text("Today's Progress")
                        .font(.headline)
                    Spacer()
                    Text("\(Int(viewModel.todayProgress * 100))%")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                ProgressBar(progress: viewModel.todayProgress, color: .green)
                    .frame(height: 8)
            }
            
            // Weekly Progress
            VStack(spacing: 8) {
                HStack {
                    Text("Weekly Progress")
                        .font(.headline)
                    Spacer()
                    Text("\(Int(viewModel.weeklyProgress * 100))%")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                ProgressBar(progress: viewModel.weeklyProgress, color: .blue)
                    .frame(height: 8)
            }
            
            // Reset Timer
            Text("Resets in \(viewModel.timeUntilReset)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(20)
    }
    
    private var weekCalendarView: some View {
        HStack(spacing: 8) {
            ForEach(weekDates, id: \.self) { date in
                let isToday = Calendar.current.isDate(date, inSameDayAs: Date())
                let hasExercises = viewModel.hasExercises(on: date)
                
                VStack(spacing: 8) {
                    Text(date.formatted(.dateTime.weekday(.narrow)))
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(date.formatted(.dateTime.day()))
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(isToday ? .white : .gray)
                    
                    Circle()
                        .fill(hasExercises ? gradientForDate(date) : Color.clear)
                        .frame(width: 6, height: 6)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isToday ? Color.white.opacity(0.1) : Color.clear)
                )
            }
        }
    }
    
    private var completedExercisesGrid: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Completed Exercises")
                .font(.headline)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ForEach(viewModel.completedExercises) { exercise in
                    CompletedExerciseCard(exercise: exercise)
                }
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: "figure.run.circle")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("No exercises completed yet this week")
                .font(.headline)
                .foregroundColor(.gray)
            
            Text("Complete your first exercise to start tracking progress!")
                .font(.subheadline)
                .foregroundColor(.gray.opacity(0.8))
                .multilineTextAlignment(.center)
        }
        .padding(.top, 40)
    }
    
    private func gradientForDate(_ date: Date) -> Color {
        let colors: [Color] = [.blue, .purple, .pink]
        let dayOfWeek = Calendar.current.component(.weekday, from: date) - 1
        let colorIndex = dayOfWeek % colors.count
        return colors[colorIndex]
    }
}

struct CompletedExerciseCard: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(spacing: 12) {
            // Icon
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                colorForBodyPart(exercise.bodyPart),
                                colorForBodyPart(exercise.bodyPart).opacity(0.6)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 50, height: 50)
                
                Image(systemName: iconForBodyPart(exercise.bodyPart))
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            
            Text(exercise.bodyPart.rawValue)
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func colorForBodyPart(_ bodyPart: BodyPart) -> Color {
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
    
    private func iconForBodyPart(_ bodyPart: BodyPart) -> String {
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

struct ProgressBar: View {
    let progress: Double
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .cornerRadius(4)
                
                Rectangle()
                    .fill(color)
                    .cornerRadius(4)
                    .frame(width: geometry.size.width * min(max(progress, 0), 1))
            }
        }
    }
}

#Preview {
    ProgressView()
        .preferredColorScheme(.dark)
} 