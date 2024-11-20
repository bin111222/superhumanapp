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
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = ExercisesViewModel()
    @State private var currentExercise: Exercise
    
    init(exercise: Exercise) {
        self.exercise = exercise
        _currentExercise = State(initialValue: exercise)
    }
    
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
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 16) {
                    // Change Exercise Button
                    Button {
                        changeExercise()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "shuffle")
                            Text("Change")
                        }
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
            ExerciseTimerView(duration: currentExercise.duration)
        }
    }
    
    private var exerciseHeader: some View {
        VStack(spacing: 16) {
            // Exercise Image or Video
            if let videoURL = currentExercise.videoURL {
                EnhancedVideoPlayer(url: videoURL)
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
                // Title and Body Part
                VStack(alignment: .leading, spacing: 8) {
                    Text(currentExercise.name)
                        .font(.title2.bold())
                    
                    Text(currentExercise.bodyPart.rawValue)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // Description
                Text(currentExercise.description)
                    .font(.body)
                    .foregroundColor(.gray)
                
                // Quick Stats with difficulty badge
                HStack(spacing: 20) {
                    StatBadge(icon: "clock", text: "\(Int(currentExercise.duration/60)) min")
                    StatBadge(icon: "repeat", text: "3 sets")
                    
                    // Difficulty Badge
                    Text(currentExercise.difficulty.rawValue)
                        .font(.caption.bold())
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(currentExercise.difficulty.color.opacity(0.2))
                        .foregroundColor(currentExercise.difficulty.color)
                        .cornerRadius(12)
                }
                .padding(.top, 4)
            }
            .padding(.horizontal)
        }
    }
    
    private var tabSection: some View {
        VStack(spacing: 0) {
            HStack {
                ForEach(["Instructions", "Benefits"], id: \.self) { tab in
                    let index = ["Instructions", "Benefits"].firstIndex(of: tab) ?? 0
                    TabButton(text: tab, isSelected: selectedTab == index) {
                        withAnimation {
                            selectedTab = index
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 1)
        }
    }
    
    private var tabContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            switch selectedTab {
            case 0:
                InstructionsView(steps: currentExercise.steps)
            case 1:
                BenefitsView(benefits: currentExercise.benefits)
            default:
                EmptyView()
            }
        }
        .padding()
        .transition(.opacity)
        .animation(.easeInOut, value: selectedTab)
    }
    
    private func changeExercise() {
        if let newExercise = viewModel.getRandomExercise(for: currentExercise.bodyPart) {
            withAnimation {
                currentExercise = newExercise
            }
        }
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

struct ExerciseTimerView: View {
    let duration: TimeInterval
    @Environment(\.dismiss) private var dismiss
    @State private var timeRemaining: TimeInterval
    @State private var isRunning = false
    @State private var progress: Double = 1.0
    @State private var waveOffset = 0.0
    @State private var currentMessage = motivationalMessages[0]
    @State private var isWaveAnimating = false
    
    init(duration: TimeInterval) {
        self.duration = duration
        _timeRemaining = State(initialValue: duration)
    }
    
    var body: some View {
        ZStack {
            // Background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Motivational Message - Moved to top
                Text(currentMessage)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 40) // Added top padding
                    .transition(.opacity)
                    .animation(.easeInOut, value: currentMessage)
                
                Spacer()
                
                // Timer Display with Wave Animation
                ZStack {
                    // Container
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 120, height: 400) // Increased width and height
                    
                    // Wave Animation
                    GeometryReader { geometry in
                        ZStack(alignment: .bottom) {
                            // Wave Shape
                            WaveShape(offset: waveOffset, percent: progress, amplitude: 2, frequency: 2)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            SuperhumanTheme.primaryColor,
                                            SuperhumanTheme.primaryColor.opacity(0.7)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(height: 400) // Match container height
                            
                            // Time Display
                            Text(timeString(from: timeRemaining))
                                .font(.system(size: 40, weight: .bold, design: .rounded)) // Increased font size
                                .foregroundColor(.white)
                                .contentTransition(.numericText())
                                .frame(width: 120)
                                .background(.black.opacity(0.3))
                                .offset(y: -180) // Adjusted position
                        }
                    }
                    .frame(width: 120, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                .overlay(
                    // Play/Pause Button
                    Button(action: {
                        withAnimation(.spring()) {
                            isRunning.toggle()
                        }
                    }) {
                        Image(systemName: isRunning ? "pause.fill" : "play.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60) // Increased button size
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(SuperhumanTheme.primaryColor.opacity(0.5), lineWidth: 2)
                            )
                    }
                    .offset(y: 240), // Adjusted position
                    alignment: .center
                )
                
                Spacer()
                
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
                    
                    // Complete Button
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Complete")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(25)
                    }
                }
                .padding(.bottom, 40) // Added bottom padding
            }
        }
        .onAppear {
            startTimer()
            startMotivationalMessageTimer()
            // Start wave animation
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                waveOffset = .pi * 2
            }
        }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            guard isRunning else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 0.1
                progress = timeRemaining / duration
            } else {
                timer.invalidate()
                hapticFeedback()
            }
        }
    }
    
    private func resetTimer() {
        timeRemaining = duration
        progress = 1.0
        isRunning = false
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

// Wave Shape for Animation
struct WaveShape: Shape {
    var offset: Double
    var percent: Double
    var amplitude: Double = 5 // Wave height
    var frequency: Double = 2 // Wave frequency
    
    var animatableData: Double {
        get { offset }
        set { offset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let progressHeight = height * (1 - percent)
        let midWidth = width / 2
        
        path.move(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: progressHeight))
        
        // Create more natural wave effect
        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / midWidth
            let normalizedX = relativeX * .pi * frequency
            let sine = sin(normalizedX + offset)
            let y = progressHeight + sine * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: width, y: height))
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    NavigationView {
        ExerciseDetailView(exercise: ExerciseDatabase.exercises[0])
    }
} 

