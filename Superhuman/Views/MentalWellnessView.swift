import SwiftUI
import AVKit

struct MentalWellnessView: View {
    @StateObject private var viewModel = MentalWellnessViewModel()
    @State private var selectedActivity: MentalWellnessActivity?
    
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
                                viewModel.selectedType = type
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
                    MentalWellnessDetailView(
                        activity: activity,
                        selectedType: $viewModel.selectedType,
                        onChangeActivity: {
                            if let type = viewModel.selectedType {
                                if let newActivity = viewModel.getRandomActivity(for: type, excluding: activity) {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        selectedActivity = newActivity
                                    }
                                }
                            }
                        }
                    )
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(
                        leading: Button {
                            selectedActivity = nil
                            viewModel.selectedType = nil
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
                                if let type = viewModel.selectedType {
                                    if let newActivity = viewModel.getRandomActivity(for: type, excluding: activity) {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            selectedActivity = newActivity
                                        }
                                    }
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
                                viewModel.handleActivityCompletion(activity)
                                selectedActivity = nil
                                viewModel.selectedType = nil
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
}

struct MentalWellnessDetailView: View {
    let activity: MentalWellnessActivity
    @Binding var selectedType: MentalWellnessType?
    let onChangeActivity: () -> Void
    @State private var selectedTab = 0
    @State private var showingTimer = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header Section with Video/Image Support
                VStack(spacing: 16) {
                    // Video or Image Container
                    ZStack {
                        if let videoURL = activity.videoURL {
                            EnhancedVideoPlayer(url: videoURL)
                                .frame(height: 220)
                                .transition(.opacity)
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
                                .transition(.opacity)
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: activity.id)
                    
                    // Title and Description
                    VStack(spacing: 8) {
                        Text(activity.title)
                            .font(.title2.bold())
                            .transition(.opacity)
                        
                        Text(activity.description)
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .transition(.opacity)
                    }
                    .padding(.horizontal)
                    .animation(.easeInOut(duration: 0.3), value: activity.id)
                    
                    // Duration Badge
                    HStack(spacing: 20) {
                        StatBadge(icon: "clock", text: activity.formattedDuration)
                    }
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.3), value: activity.id)
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
                
                // Tab Content with transition
                VStack(alignment: .leading, spacing: 20) {
                    switch selectedTab {
                    case 0:
                        StepsView(steps: activity.steps)
                            .transition(.opacity)
                    case 1:
                        BenefitsView(benefits: activity.benefits)
                            .transition(.opacity)
                    case 2:
                        TipsView(tips: activity.tips)
                            .transition(.opacity)
                    default:
                        EmptyView()
                    }
                }
                .padding()
                .animation(.easeInOut(duration: 0.3), value: selectedTab)
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