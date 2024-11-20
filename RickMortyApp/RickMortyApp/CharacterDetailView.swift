import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    .clipShape(Rectangle())
                    
                    HStack(){
                        Text(character.name)
                            .font(.largeTitle)
                            .bold()
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
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Gender:").bold()
                            Text(character.gender)
                        }
                        HStack {
                            Text("Status:").bold()
                            Text(character.status)
                        }
                    }
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .cornerRadius(10)
                }
                .padding()
                .navigationTitle("Character Page")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
