import SwiftUI
import Charts

struct ProgressView: View {
    @StateObject private var viewModel = ProgressViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Stats Overview
                    StatsOverview(viewModel: viewModel)
                    
                    // Time Frame Picker
                    Picker("Time Frame", selection: $viewModel.selectedTimeFrame) {
                        ForEach(ProgressViewModel.TimeFrame.allCases, id: \.self) { timeFrame in
                            Text(timeFrame.rawValue).tag(timeFrame)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                    // Progress Chart
                    ProgressChart(progress: viewModel.weeklyProgress)
                        .frame(height: 220)
                        .padding()
                    
                    // Recent Activity
                    RecentActivityList(progress: viewModel.weeklyProgress)
                }
                .padding(.vertical)
            }
            .navigationTitle("Progress")
        }
    }
}

// MARK: - Supporting Views
private struct StatsOverview: View {
    @ObservedObject var viewModel: ProgressViewModel
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 16) {
            StatCard(
                title: "This Week",
                value: "\(viewModel.totalMinutesThisWeek)",
                unit: "min",
                icon: "clock.fill"
            )
            
            StatCard(
                title: "Streak",
                value: "\(viewModel.streakDays)",
                unit: "days",
                icon: "flame.fill"
            )
            
            StatCard(
                title: "Completion",
                value: "\(Int(viewModel.completionRate * 100))",
                unit: "%",
                icon: "checkmark.circle.fill"
            )
        }
        .padding(.horizontal)
    }
}

private struct StatCard: View {
    let title: String
    let value: String
    let unit: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(SuperhumanTheme.primaryColor)
            
            Text(value)
                .font(.title2.bold())
            
            Text(unit)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

private struct ProgressChart: View {
    let progress: [WorkoutProgress]
    
    var body: some View {
        Chart {
            ForEach(progress) { item in
                BarMark(
                    x: .value("Date", item.formattedDate),
                    y: .value("Duration", item.duration / 60)
                )
                .foregroundStyle(SuperhumanTheme.primaryColor)
            }
        }
        .chartXAxis {
            AxisMarks(values: .automatic) { value in
                AxisValueLabel {
                    if let date = value.as(String.self) {
                        Text(date)
                            .font(.caption2)
                            .rotationEffect(.degrees(-45))
                    }
                }
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
    }
}

private struct RecentActivityList: View {
    let progress: [WorkoutProgress]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recent Activity")
                .font(SuperhumanTheme.headlineFont)
                .padding(.horizontal)
            
            ForEach(progress) { activity in
                ActivityRow(activity: activity)
            }
        }
    }
}

private struct ActivityRow: View {
    let activity: WorkoutProgress
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(activity.formattedDate)
                    .font(SuperhumanTheme.bodyFont)
                
                Text("\(activity.exercisesCompleted) exercises completed")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("\(Int(activity.duration / 60)) min")
                .font(.headline)
                .foregroundColor(SuperhumanTheme.primaryColor)
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

#Preview {
    ProgressView()
} 