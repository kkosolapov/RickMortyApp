import Foundation

struct CharacterResponse: Codable {
    let info: PageInfo
    let results: [Character]
}
