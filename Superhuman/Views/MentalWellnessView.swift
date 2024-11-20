import SwiftUI
import AVKit

struct MentalWellnessView: View {
    @State private var selectedType: MentalWellnessType?
    @State private var selectedActivity: MentalWellnessActivity?
    @StateObject private var viewModel = MentalWellnessViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Title and Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("Mental Wellbeing")
                        .font(.title.bold())
                    
                    Text("Explore practices for mental wellness and inner peace")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 16)
                
                ScrollView {
                    // Categories Grid
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        ForEach(MentalWellnessType.allCases) { type in
                            WellnessTypeCard(type: type) {
                                selectedType = type
                                selectedActivity = viewModel.getRandomActivity(for: type)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(item: $selectedActivity) { activity in
                NavigationView {
                    MentalWellnessDetailView(activity: activity, selectedType: $selectedType)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(
                            leading: Button {
                                selectedActivity = nil
                                selectedType = nil
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: "chevron.left")
                                    Text("Back")
                                }
                                .foregroundColor(SuperhumanTheme.primaryColor)
                            },
                            trailing: HStack(spacing: 16) {
                                // Change Activity Button
                                Button {
                                    if let type = selectedType {
                                        selectedActivity = viewModel.getRandomActivity(for: type)
                                    }
                                } label: {
                                    HStack(spacing: 4) {
                                        Image(systemName: "shuffle")
                                        Text("Change")
                                    }
                                    .foregroundColor(SuperhumanTheme.primaryColor)
                                }
                                
                                // Complete Button
                                Button("Complete") {
                                    handleActivityCompletion(activity)
                                }
                                .foregroundColor(SuperhumanTheme.primaryColor)
                                .font(.headline)
                            }
                        )
                }
                .interactiveDismissDisabled()
            }
        }
    }
    
    private func handleActivityCompletion(_ activity: MentalWellnessActivity) {
        // Post notification for progress tracking
        NotificationCenter.default.post(
            name: NSNotification.Name("MentalWellnessActivityCompleted"),
            object: activity
        )
        selectedActivity = nil
        selectedType = nil
    }
}

struct MentalWellnessDetailView: View {
    let activity: MentalWellnessActivity
    @Binding var selectedType: MentalWellnessType?
    @State private var selectedTab = 0
    @State private var showingTimer = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header Section
                VStack(spacing: 16) {
                    // Video or Icon
                    if let videoURL = activity.videoURL {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(height: 220)
                    } else {
                        Image(systemName: activity.type.icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .foregroundColor(activity.type.color[0])
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: activity.type.color,
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ).opacity(0.2)
                            )
                    }
                    
                    // Title and Description
                    VStack(spacing: 8) {
                        Text(activity.title)
                            .font(.title2.bold())
                        
                        Text(activity.description)
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal)
                    
                    // Duration Badge
                    HStack(spacing: 20) {
                        StatBadge(icon: "clock", text: activity.formattedDuration)
                    }
                }
                
                // Content Tabs
                VStack(spacing: 0) {
                    HStack {
                        ForEach(["Steps", "Benefits", "Tips"], id: \.self) { tab in
                            let index = ["Steps", "Benefits", "Tips"].firstIndex(of: tab) ?? 0
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
                
                // Tab Content
                VStack(alignment: .leading, spacing: 20) {
                    switch selectedTab {
                    case 0:
                        StepsView(steps: activity.steps)
                    case 1:
                        BenefitsView(benefits: activity.benefits)
                    case 2:
                        TipsView(tips: activity.tips)
                    default:
                        EmptyView()
                    }
                }
                .padding()
                .transition(.opacity)
                .animation(.easeInOut, value: selectedTab)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingTimer = true
                } label: {
                    Image(systemName: "timer")
                        .foregroundColor(SuperhumanTheme.primaryColor)
                }
            }
        }
        .sheet(isPresented: $showingTimer) {
            ExerciseTimerView(duration: activity.duration)
        }
    }
}

class MentalWellnessViewModel: ObservableObject {
    func getRandomActivity(for type: MentalWellnessType) -> MentalWellnessActivity? {
        let activities = MentalWellnessDatabase.activitiesForType(type)
        return activities.randomElement()
    }
}

// Supporting Views
struct StepsView: View {
    let steps: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 16) {
                    Text("\(index + 1)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 32, height: 32)
                        .background(SuperhumanTheme.primaryColor)
                        .clipShape(Circle())
                    
                    Text(step)
                        .font(.body)
                }
            }
        }
    }
}

struct WellnessTypeCard: View {
    let type: MentalWellnessType
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            GeometryReader { geometry in
                VStack(spacing: 12) {
                    Spacer()
                    
                    Image(systemName: type.icon)
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                    
                    Text(type.rawValue)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.width)
                .background(
                    LinearGradient(
                        colors: type.color,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(20)
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct WellnessActivityCard: View {
    let activity: MentalWellnessActivity
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: activity.type.icon)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(
                        LinearGradient(
                            colors: activity.type.color,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(activity.title)
                        .font(.headline)
                    
                    Text(activity.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                
                Spacer()
                
                Text(activity.formattedDuration)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal)
    }
}

#Preview {
    NavigationView {
        MentalWellnessView()
    }
} 