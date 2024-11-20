import SwiftUI
import AVKit

private let motivationalMessages = [
    "Push through! You're getting stronger! 💪",
    "Every second counts towards your goal! 🎯",
    "You've got this - stay focused! 🔥",
    "Feel your body getting stronger! ⚡️",
    "Breathe and stay present! 🧘‍♂️",
    "You're building your superhuman self! 🦸‍♂️",
    "Almost there - keep pushing! 🚀",
    "Your dedication is inspiring! ✨",
    "Transform your body, transform your life! 🌟",
    "Feel the power within you! 💫",
    "You're doing amazing! Keep going! 🌈",
    "Each second brings transformation! 🔄",
    "Stay strong, stay determined! 💎",
    "You're becoming unstoppable! 🏃‍♂️",
    "Feel the energy flow through you! ⚡️",
    "Your potential is limitless! 🌠",
    "Making the impossible possible! 🎯",
    "You're writing your success story! 📖",
    "This is your moment to shine! ⭐️",
    "Unleash your inner strength! 🔓",
    "Today's effort is tomorrow's strength! 🌅",
    "Every rep brings you closer to your goals! 📈",
    "You're stronger than you think! 💪",
    "Excellence is a habit - build it now! 🌟",
    "Feel the power of transformation! 🔄",
    "Your journey to greatness continues! 🚀",
    "Break limits, set new records! 📊",
    "Mind over matter - you've got this! 🧠",
    "Your dedication is your superpower! 🦸‍♀️",
    "Progress is progress, no matter how small! 💫"
]

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
    @State private var progress: Double = 1.0
    @State private var glowOpacity = 0.0
    @State private var currentMessage = motivationalMessages[0]
    
    init(duration: TimeInterval) {
        self.duration = duration
        _timeRemaining = State(initialValue: duration)
    }
    
    var body: some View {
        ZStack {
            // Background
            Color.black.opacity(0.9)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Timer Display
                ZStack {
                    // Background Track
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 60)
                    
                    // Progress Bar
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            // Main Progress Bar
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [SuperhumanTheme.primaryColor, SuperhumanTheme.primaryColor.opacity(0.7)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: geometry.size.width * progress)
                            
                            // Electric Glow Effect
                            if progress > 0 {
                                Capsule()
                                    .fill(SuperhumanTheme.primaryColor)
                                    .frame(width: 4, height: 60)
                                    .offset(x: geometry.size.width * progress - 2)
                                    .opacity(glowOpacity)
                                    .blur(radius: 2)
                            }
                        }
                    }
                    .frame(height: 60)
                    .clipShape(Capsule())
                    
                    // Time Display
                    HStack(spacing: 4) {
                        Text(timeString(from: timeRemaining))
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .contentTransition(.numericText())
                        
                        Text("sec")
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .foregroundColor(.white.opacity(0.7))
                            .offset(y: 2)
                    }
                    .padding(.horizontal, 20)
                    .background(.black.opacity(0.3))
                    .clipShape(Capsule())
                    
                    // Pause/Play Button
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation(.spring()) {
                                isRunning.toggle()
                            }
                        }) {
                            Image(systemName: isRunning ? "pause.fill" : "play.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.black.opacity(0.3))
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(SuperhumanTheme.primaryColor.opacity(0.5), lineWidth: 2)
                                )
                        }
                        .padding(.trailing, 8)
                    }
                }
                .frame(height: 60)
                .padding(.horizontal)
                
                // Add Motivational Message
                Text(currentMessage)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .transition(.opacity)
                    .animation(.easeInOut, value: currentMessage)
                
                // Control Buttons
                HStack(spacing: 30) {
                    // Reset Button
                    Button(action: {
                        withAnimation(.spring()) {
                            resetTimer()
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.title)
                            .foregroundColor(.white.opacity(0.7))
                            .rotationEffect(.degrees(isRunning ? 360 : 0))
                            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: isRunning)
                    }
                    
                    // Close Button
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Done")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(25)
                    }
                }
            }
        }
        .onAppear {
            startTimer()
            startMotivationalMessageTimer()
        }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            guard isRunning else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 0.1
                progress = timeRemaining / duration
                
                // Pulse glow effect
                withAnimation(.easeInOut(duration: 0.5)) {
                    glowOpacity = 0.8
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        glowOpacity = 0
                    }
                }
            } else {
                timer.invalidate()
                hapticFeedback()
                // Final animation
                withAnimation(.spring()) {
                    glowOpacity = 1
                }
            }
        }
    }
    
    private func resetTimer() {
        timeRemaining = duration
        progress = 1.0
        isRunning = false
        glowOpacity = 0
    }
    
    private func hapticFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    private func timeString(from timeInterval: TimeInterval) -> String {
        let seconds = Int(ceil(timeInterval))
        return "\(seconds)"
    }
    
    private func startMotivationalMessageTimer() {
        Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { _ in
            withAnimation {
                currentMessage = motivationalMessages.randomElement() ?? currentMessage
            }
        }
    }
}

#Preview {
    NavigationView {
        ExerciseDetailView(exercise: ExerciseDatabase.exercises[0])
    }
} 

