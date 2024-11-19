import SwiftUI
import AVKit

struct ExerciseDetailView: View {
    let exercise: Exercise
    @State private var selectedTab = 0
    @State private var showingTimer = false
    @State private var isBookmarked = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header Section
                exerciseHeader
                
                // Main Content Tabs
                tabSection
                
                // Content based on selected tab
                tabContent
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                    Button {
                        isBookmarked.toggle()
                    } label: {
                        Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                            .foregroundColor(SuperhumanTheme.primaryColor)
                    }
                    
                    Button {
                        showingTimer = true
                    } label: {
                        Image(systemName: "timer")
                            .foregroundColor(SuperhumanTheme.primaryColor)
                    }
                }
            }
        }
        .sheet(isPresented: $showingTimer) {
            ExerciseTimerView(duration: exercise.duration)
        }
    }
    
    private var exerciseHeader: some View {
        VStack(spacing: 16) {
            // Exercise Image or Video
            if let videoURL = exercise.videoURL {
                VideoPlayer(player: AVPlayer(url: videoURL))
                    .frame(height: 220)
            } else {
                Image(systemName: "figure.mixed.cardio")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 220)
                    .foregroundColor(SuperhumanTheme.primaryColor)
                    .padding()
                    .background(Color.gray.opacity(0.1))
            }
            
            VStack(alignment: .leading, spacing: 12) {
                // Title and Difficulty
                HStack {
                    Text(exercise.name)
                        .font(.title2.bold())
                    
                    Spacer()
                    
                    Text(exercise.difficulty.rawValue)
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(exercise.difficulty.color.opacity(0.2))
                        .foregroundColor(exercise.difficulty.color)
                        .cornerRadius(12)
                }
                
                // Description
                Text(exercise.description)
                    .font(.body)
                    .foregroundColor(.gray)
                
                // Quick Stats
                HStack(spacing: 20) {
                    StatBadge(icon: "clock", text: "\(Int(exercise.duration/60)) min")

                    StatBadge(icon: "repeat", text: "3 sets")
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var tabSection: some View {
        Picker("Content", selection: $selectedTab) {
            Text("Instructions").tag(0)
            Text("Benefits").tag(1)
            Text("Tips").tag(2)
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
    
    private var tabContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            switch selectedTab {
            case 0:
                InstructionsView(steps: exercise.steps)
            case 1:
                BenefitsView(benefits: exercise.benefits)
            case 2:
                TipsView(bodyPart: exercise.bodyPart)
            default:
                EmptyView()
            }
        }
        .padding()
    }
}

// MARK: - Supporting Views
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

struct InstructionsView: View {
    let steps: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 16) {
                    // Step number with improved styling
                    Text("\(index + 1)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                        .background(SuperhumanTheme.primaryColor)
                        .clipShape(Circle())
                        .shadow(color: SuperhumanTheme.primaryColor.opacity(0.3), 
                               radius: 4, x: 0, y: 2)
                    
                    // Step description with improved readability
                    Text(step)
                        .font(.body)
                        .lineSpacing(6)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.05))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                )
            }
        }
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
    let bodyPart: BodyPart
    
    var tips: [String] {
        // Add specific tips for each body part
        switch bodyPart {
        case .wrists:
            return [
                "Keep movements slow and controlled",
                "Stop if you feel pain",
                "Maintain neutral wrist position when possible"
            ]
        // Add cases for other body parts
        default:
            return [
                "Start with easier variations",
                "Focus on proper form",
                "Breathe steadily throughout"
            ]
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
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

struct ExerciseTimerView: View {
    let duration: TimeInterval
    @Environment(\.dismiss) private var dismiss
    @State private var timeRemaining: TimeInterval
    @State private var isRunning = false
    
    init(duration: TimeInterval) {
        self.duration = duration
        _timeRemaining = State(initialValue: duration)
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text(timeString(from: timeRemaining))
                .font(.system(size: 60, weight: .bold, design: .rounded))
            
            HStack(spacing: 20) {
                Button(action: {
                    isRunning.toggle()
                }) {
                    Image(systemName: isRunning ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(SuperhumanTheme.primaryColor)
                }
                
                Button(action: {
                    timeRemaining = duration
                    isRunning = false
                }) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .onAppear {
            startTimer()
        }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            guard isRunning else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                // Add completion feedback here
            }
        }
    }
    
    private func timeString(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    NavigationView {
        ExerciseDetailView(exercise: ExerciseDatabase.exercises[0])
    }
} 
