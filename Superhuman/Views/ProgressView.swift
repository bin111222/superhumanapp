import SwiftUI
import Charts

struct TimeFramePicker: View {
    @Binding var selection: ProgressViewModel.TimeFrame
    
    var body: some View {
        Picker("Time Frame", selection: $selection) {
            ForEach(ProgressViewModel.TimeFrame.allCases, id: \.self) { timeFrame in
                Text(timeFrame.rawValue)
                    .tag(timeFrame)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
}

struct ProgressView: View {
    @StateObject private var viewModel = ProgressViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Time Frame Selector
                TimeFramePicker(selection: $viewModel.selectedTimeFrame)
                
                // Stats Overview
                StatsOverview(
                    consistencyScore: viewModel.consistencyScore,
                    currentStreak: viewModel.currentStreak
                )
                
                // Physical Progress Section
                PhysicalProgressSection(progress: viewModel.bodyPartProgress)
                
                // Mental Wellness Progress
                MentalWellnessProgressSection(progress: viewModel.mentalWellnessProgress)
            }
            .padding()
        }
        .navigationTitle("Progress")
        .background(Color.black)
    }
}

struct StatsOverview: View {
    let consistencyScore: Double
    let currentStreak: Int
    
    var body: some View {
        HStack(spacing: 16) {
            StatCard(
                title: "Consistency",
                value: "\(Int(consistencyScore * 100))%",
                icon: "chart.line.uptrend.xyaxis"
            )
            
            StatCard(
                title: "Streak",
                value: "\(currentStreak) days",
                icon: "flame.fill"
            )
        }
        .padding(.horizontal)
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(SuperhumanTheme.primaryColor)
            
            Text(value)
                .font(.headline)
                .bold()
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(15)
    }
}

struct PhysicalProgressSection: View {
    let progress: [BodyPart: Double]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Physical Progress")
                .font(.title2.bold())
                .foregroundColor(SuperhumanTheme.primaryColor)
            
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 80))
            ], spacing: 20) {
                ForEach(BodyPart.allCases, id: \.self) { bodyPart in
                    ProgressRing(
                        progress: progress[bodyPart] ?? 0,
                        label: bodyPart.rawValue,
                        color: SuperhumanTheme.primaryColor,
                        size: 80
                    )
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(15)
    }
}

struct MentalWellnessProgressSection: View {
    let progress: [ProgressViewModel.MentalWellnessType: Double]
    private let mentalWellnessColor = Color.blue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Mental Wellness")
                .font(.title2.bold())
                .foregroundColor(mentalWellnessColor)
            
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 80))
            ], spacing: 20) {
                ForEach(ProgressViewModel.MentalWellnessType.allCases, id: \.self) { type in
                    ProgressRing(
                        progress: progress[type] ?? 0,
                        label: type.rawValue,
                        color: mentalWellnessColor,
                        size: 80
                    )
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.3))
        .cornerRadius(15)
    }
}

struct ProgressRing: View {
    let progress: Double
    let label: String
    let color: Color
    let size: CGFloat
    @State private var animatedProgress: Double = 0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(color.opacity(0.2), lineWidth: 4)
                
                Circle()
                    .trim(from: 0, to: animatedProgress)
                    .stroke(color, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                
                Text("\(Int(progress * 100))%")
                    .font(.caption2.bold())
                    .foregroundColor(color)
            }
            .frame(width: size * 0.7, height: size * 0.7)
            
            Text(label)
                .font(.caption2)
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                animatedProgress = progress
            }
        }
    }
}

#Preview {
    ProgressView()
        .preferredColorScheme(.dark)
} 