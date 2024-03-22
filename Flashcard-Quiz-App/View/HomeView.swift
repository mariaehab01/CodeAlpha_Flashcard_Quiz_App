import SwiftUI

struct HomeView: View {
    @ObservedObject var flashcardManager: FlashcardManager
    @State private var isShowingAddScreen = false
    @State private var selectedFlashcard: Flashcard?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to your flashcard study session!")
                    .font(.title)
                    .fontWeight(.regular)
                    .padding()
                
                Button("Add Flashcard") {
                    isShowingAddScreen = true
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                .sheet(isPresented: $isShowingAddScreen) {
                    // Add flashcard screen
                    AddFlashcardView(flashcardManager: flashcardManager, isPresented: $isShowingAddScreen)
                }
                List {
                    ForEach(flashcardManager.flashcards, id: \.self) { flashcard in
                        NavigationLink(destination: FlashcardDetailView(flashcard: flashcard)) {
                            HStack {
                                Text(flashcard.question)
                                Spacer()
                            }
                        }
                        Button(action: {
                            flashcardManager.deleteFlashcard(flashcard)
                        }) {
                            HStack{
                                Text("Delete").foregroundColor(.red)
                                Image(systemName: "trash").foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationBarItems(trailing:HStack {
                Text("Home").font(.headline)
                Image(systemName: "house")
            }
            )
        }
    }
}
