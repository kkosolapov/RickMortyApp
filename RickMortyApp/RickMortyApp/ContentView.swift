import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            HStack(alignment: .top, spacing: 10) {
                                AsyncImage(url: URL(string: character.image)) { image in
                                    image.resizable()
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 110, height: 110)
                                .clipShape(Rectangle())
                                
                                HStack(alignment: .top) {
                                    VStack() {
                                        Text(character.name)
                                            .bold()
                                            .font(.headline)
                                            .foregroundColor(.black)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(character.gender)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(
                                            Capsule()
                                                .fill(character.gender.lowercased() == "female" ? Color.pink : Color.blue)
                                        )
                                }
                                .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 0)
                                .onAppear {
                                    if character == viewModel.characters.last {
                                        viewModel.fetchCharacters()
                                    }
                                }
                                .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 0)
                                .onAppear {
                                    if character == viewModel.characters.last {
                                        viewModel.fetchCharacters()
                                    }
                                }
                                
                                
                            }
                            .shadow(color: .gray.opacity(0), radius: 3, x: 0, y: 1)
                        }
                        
                    }
                }
                .listStyle(PlainListStyle())
                if viewModel.characters.isEmpty {
                    ProgressView("Loading...")
                        .padding()
                }
            }
            .padding()
            .onAppear {
                if viewModel.characters.isEmpty {
                    viewModel.fetchCharacters()
                }
            }
            .navigationTitle("Characters")
        }
    }
}
