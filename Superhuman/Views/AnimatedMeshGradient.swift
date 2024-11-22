import SwiftUI

struct MeshGradient: View {
    let width: Int
    let height: Int
    let points: [[CGFloat]]
    let colors: [Color]
    let phase: Double
    
    private func wave(_ x: Double, _ y: Double, amplitude: Double = 0.1, frequency: Double = 1.0) -> Double {
        let combinedWave = sin(x * frequency + phase) * cos(y * frequency + phase) * amplitude
        let secondaryWave = cos(x * frequency * 0.5 - phase) * sin(y * frequency * 0.5 - phase) * (amplitude * 0.5)
        return (combinedWave + secondaryWave) * 0.5
    }
    
    var animatedPoints: [[CGFloat]] {
        points.enumerated().map { index, point in
            let normalizedIndex = Double(index) / Double(points.count)
            let x = point[0] + wave(normalizedIndex, point[1], amplitude: 0.08, frequency: 2.0)
            let y = point[1] + wave(point[0], normalizedIndex, amplitude: 0.08, frequency: 1.5)
            return [x, y]
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            Canvas { context, size in
                let rect = CGRect(origin: .zero, size: size)
                
                // Create multiple overlapping gradients for a more fluid look
                for i in 0..<3 {
                    let offset = Double(i) * 0.1
                    let phaseOffset = phase + offset
                    
                    let startPoint = CGPoint(
                        x: size.width * (CGFloat(animatedPoints[0][0]) + CGFloat(sin(phaseOffset) * 0.1)),
                        y: size.height * (CGFloat(animatedPoints[0][1]) + CGFloat(cos(phaseOffset) * 0.1))
                    )
                    
                    let endPoint = CGPoint(
                        x: size.width * (CGFloat(animatedPoints[8][0]) + CGFloat(cos(phaseOffset) * 0.1)),
                        y: size.height * (CGFloat(animatedPoints[8][1]) + CGFloat(sin(phaseOffset) * 0.1))
                    )
                    
                    let gradient = Gradient(colors: colors.map { $0.opacity(0.5) })
                    
                    context.addFilter(.blur(radius: 30))
                    context.fill(
                        Path(rect),
                        with: .linearGradient(
                            gradient,
                            startPoint: startPoint,
                            endPoint: endPoint
                        )
                    )
                }
            }
        }
    }
}

struct AnimatedMeshGradient: View {
    var body: some View {
        TimelineView(.animation(minimumInterval: 1/60)) { timeline in
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [0.8, 0.2], [1.0, 0.5],
                    [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
                ],
                colors: [
    Color.black,                    // Base black
    Color(red: 0.0, green: 0.3, blue: 0.7), // Rich blue
    Color(red: 0.0, green: 0.6, blue: 0.3), // Vibrant green
    Color(red: 0.0, green: 0.4, blue: 0.5), // Teal (transition)
    Color.black                     // Repeat black for seamless edges
],
                phase: timeline.date.timeIntervalSince1970 * 0.5
            )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    AnimatedMeshGradient()
}
