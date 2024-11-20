import SwiftUI

struct MentalWellnessView: View {
    @State private var selectedType: MentalWellnessType?
    @State private var showingActivityDetail = false
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
                    VStack(spacing: 24) {
                        // Categories Grid
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            ForEach(MentalWellnessType.allCases) { type in
                                WellnessTypeCard(type: type) {
                                    selectedType = type
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 16)
                        
                        // Activities List
                        if let type = selectedType {
                            activitiesList(for: type)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $selectedActivity) { activity in
                MentalWellnessDetailView(activity: activity)
            }
        }
    }
    
    private func activitiesList(for type: MentalWellnessType) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(type.rawValue)
                .font(.title2.bold())
                .padding(.horizontal)
            
            ForEach(MentalWellnessDatabase.activitiesForType(type)) { activity in
                WellnessActivityCard(activity: activity) {
                    selectedActivity = activity
                }
            }
        }
    }
}

struct MentalWellnessDetailView: View {
    let activity: MentalWellnessActivity
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 8) {
                        Image(systemName: activity.type.icon)
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .background(
                                LinearGradient(
                                    colors: activity.type.color,
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .clipShape(Circle())
                        
                        Text(activity.title)
                            .font(.title2.bold())
                        
                        Text(activity.description)
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    // Steps Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Steps")
                            .font(.headline)
                        
                        ForEach(Array(activity.steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 16) {
                                Text("\(index + 1)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 24, height: 24)
                                    .background(Circle().fill(activity.type.color[0]))
                                
                                Text(step)
                                    .font(.body)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    
                    // Benefits Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Benefits")
                            .font(.headline)
                        
                        ForEach(activity.benefits, id: \.self) { benefit in
                            HStack(spacing: 12) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(activity.type.color[0])
                                Text(benefit)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    
                    // Tips Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Tips")
                            .font(.headline)
                        
                        ForEach(activity.tips, id: \.self) { tip in
                            HStack(spacing: 12) {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(.yellow)
                                Text(tip)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Done") { dismiss() })
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