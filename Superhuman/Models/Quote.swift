import Foundation

struct Quote: Identifiable, Codable {
    let id: UUID
    let text: String
    let author: String
    
    static let quotes = [
        Quote(id: UUID(), text: "The only bad workout is the one that didn't happen.", author: "Unknown"),
        Quote(id: UUID(), text: "Take care of your body. It's the only place you have to live.", author: "Jim Rohn"),
        Quote(id: UUID(), text: "The body achieves what the mind believes.", author: "Napoleon Hill"),
        Quote(id: UUID(), text: "Rome wasn't built in a day, but they worked on it every single day.", author: "Michael John Bobak"),
        Quote(id: UUID(), text: "The difference between try and triumph is just a little umph!", author: "Marvin Phillips"),
        // Add more quotes here
    ]
} 