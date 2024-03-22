//
//  QuizView.swift
//  Flashcard-Quiz-App
//
//  Created by Maria Ehab on 19/03/2024.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var flashcardManager: FlashcardManager
    @State private var score = 0
    @State private var userAnswer = ""
    @State private var currentFlashcard: Flashcard?
    @State private var answeredFlashcards: Set<Flashcard> = []

    
    var body: some View {
        NavigationView {
            VStack {
                if flashcardManager.flashcards.isEmpty{
                    Text("No flashcards available")
                        .font(.title)
                        .foregroundColor(.red)
                }
                else{
                    if let flashcard = currentFlashcard {
                        Text(flashcard.question)
                            .font(.title)
                        
                        TextField("Your answer", text: $userAnswer)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                        
                        Button("Next Question") {
                            handleAnswer(for: flashcard)
                            selectNextFlashcard()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                    } else {
                        ScoreView(score: score, totalQuestions: flashcardManager.flashcards.count, retryAction: {
                            resetQuiz()
                            selectNextFlashcard()
                        })
                        .padding()
                    }
                }
            }
            .padding()
            .navigationBarTitle("Quiz") // Set the navigation bar title here
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing:
                    HStack {
                        //Spacer() // Add a spacer to push the question mark to the right
                        Image(systemName: "questionmark.circle")
                    .foregroundColor(.black).font(.title2)
                    }
                )
        }
        .onAppear {
            resetQuiz()
            selectNextFlashcard()
        }
    }
    
    private func selectNextFlashcard() {
        let remainingFlashcards = flashcardManager.flashcards.filter { !answeredFlashcards.contains($0) }
        currentFlashcard = remainingFlashcards.randomElement()
    }

    
    private func handleAnswer(for flashcard: Flashcard) {
        if isAnswerCorrect(flashcard, userAnswer: userAnswer) {
            score += 1
        }
        answeredFlashcards.insert(flashcard)
        userAnswer = ""
    }
    
    private func isAnswerCorrect(_ flashcard: Flashcard, userAnswer: String) -> Bool {
        return userAnswer == flashcard.answer
    }

    private func resetQuiz() {
        score = 0
        answeredFlashcards.removeAll()
    }
}
