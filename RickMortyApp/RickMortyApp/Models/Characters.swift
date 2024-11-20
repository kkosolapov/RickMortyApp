import Foundation

struct Character: Codable, Identifiable, Equatable {
    let id: Int 
    let name: String
    let gender: String
    let status: String
    let image: String
    let episode: [String]
}
