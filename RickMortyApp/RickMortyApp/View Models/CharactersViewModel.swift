import Foundation

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    private var nextPageURL: String? = "https://rickandmortyapi.com/api/character"
    private var isLoading = false
    
    func fetchCharacters() {
        guard let urlString = nextPageURL, let url = URL(string: urlString), !isLoading else { return }
        
        isLoading = true
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(CharacterResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.characters.append(contentsOf: result.results)
                        self.nextPageURL = result.info.next
                        self.isLoading = false
                    }
                } catch {
                    print("Error decoding: \(error)")
                    self.isLoading = false
                }
            } else {
                self.isLoading = false
            }
        }.resume()
    }
}
