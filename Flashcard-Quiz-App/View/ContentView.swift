import SwiftUI

struct ContentView: View {
    @ObservedObject var flashcardManager = FlashcardManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack (spacing : 15){
                    Text("Welcome to Flashcard Quiz App!")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                        
                    
                    ZStack {
                        RoundedRectangle(cornerRadius:20)
                            .stroke(Color.gray, lineWidth: 2)
                            .frame(width: 352, height: 295)
                           
                    
                           
                        Image("motivation-image")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 350)
                            .padding()
                            .cornerRadius(200)
                            
                            
                    }
                    
                    NavigationLink(destination: HomeView(flashcardManager: flashcardManager)) {
                        Image("Start-Studying")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 135, height: 95)
                    }
            
                    
                    NavigationLink(destination: QuizView(flashcardManager: flashcardManager)) {
                        Image("Take-a-Quiz")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 135, height: 55)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
