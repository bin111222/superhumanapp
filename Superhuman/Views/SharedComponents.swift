import SwiftUI
import AVKit

// Shared Components
struct TabButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(text)
                    .font(.subheadline)
                    .fontWeight(isSelected ? .bold : .regular)
                    .foregroundColor(isSelected ? .white : .gray)
                
                Rectangle()
                    .fill(isSelected ? SuperhumanTheme.primaryColor : Color.clear)
                    .frame(height: 2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

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
    let tips: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
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

class VideoPlayerViewModel: NSObject, ObservableObject {
    @Published var isLoading = true
    var player: AVPlayer
    
    init(url: URL) {
        self.player = AVPlayer(url: url)
        super.init()
        
        // Configure for looping
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                             object: player.currentItem,
                                             queue: .main) { [weak self] _ in
            self?.player.seek(to: CMTime.zero)
            self?.player.play()
        }
        
        // Configure audio session for mixing
        try? AVAudioSession.sharedInstance().setCategory(
            .playback,
            mode: .moviePlayback,
            options: [.mixWithOthers, .duckOthers] // duckOthers will lower other audio
        )
        
        // Add observer for loading state
        player.currentItem?.addObserver(self, forKeyPath: "status", options: [.new, .old], context: nil)
        
        // Configure player
        player.actionAtItemEnd = .none // Prevents stopping at end
        
        // Add periodic time observer
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] _ in
            if self?.player.currentItem?.status == .readyToPlay {
                self?.isLoading = false
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status" {
            if player.currentItem?.status == .readyToPlay {
                isLoading = false
            }
        }
    }
    
    deinit {
        player.currentItem?.removeObserver(self, forKeyPath: "status")
    }
}

struct EnhancedVideoPlayer: View {
    let url: URL
    @StateObject private var viewModel: VideoPlayerViewModel
    
    init(url: URL) {
        self.url = url
        _viewModel = StateObject(wrappedValue: VideoPlayerViewModel(url: url))
    }
    
    var body: some View {
        AVPlayerViewController.View(player: viewModel.player)
            .onAppear {
                // Configure audio session
                try? AVAudioSession.sharedInstance().setCategory(
                    .playback,
                    mode: .default,
                    options: [.mixWithOthers, .allowAirPlay]
                )
                
                viewModel.player.play()
            }
            .onDisappear {
                viewModel.player.pause()
            }
            .overlay(
                Group {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.5)
                    }
                }
            )
    }
}

// Add AVPlayerViewController View extension
extension AVPlayerViewController {
    struct View: UIViewControllerRepresentable {
        let player: AVPlayer
        
        func makeUIViewController(context: Context) -> AVPlayerViewController {
            let controller = AVPlayerViewController()
            controller.player = player
            controller.showsPlaybackControls = true
            
            // Enable full screen by default
            controller.entersFullScreenWhenPlaybackBegins = false
            controller.exitsFullScreenWhenPlaybackEnds = false
            
            // Show all controls
            controller.showsTimecodes = true
            controller.allowsPictureInPicturePlayback = true
            
            return controller
        }
        
        func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
            uiViewController.player = player
        }
    }
}

struct VideoPlayerFullScreen: View {
    let url: URL
    @Binding var isPresented: Bool
    @StateObject private var viewModel: VideoPlayerViewModel
    
    init(url: URL, isPresented: Binding<Bool>) {
        self.url = url
        self._isPresented = isPresented
        _viewModel = StateObject(wrappedValue: VideoPlayerViewModel(url: url))
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VideoPlayer(player: viewModel.player)
                .rotationEffect(.degrees(90))
                .frame(
                    width: UIScreen.main.bounds.height,
                    height: UIScreen.main.bounds.width
                )
            
            // Close Button
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    }
                    .padding()
                }
                Spacer()
            }
            .padding(.top, 20)
        }
        .onAppear {
            viewModel.player.play()
            // Lock device orientation to landscape
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
        .onDisappear {
            viewModel.player.pause()
            // Reset orientation to portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }
} 