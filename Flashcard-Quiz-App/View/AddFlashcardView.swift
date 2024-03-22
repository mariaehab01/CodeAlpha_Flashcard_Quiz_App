//
//  AddFlashcardView.swift
//  Flashcard-Quiz-App
//
//  Created by Maria Ehab on 21/03/2024.
//

import SwiftUI

struct AddFlashcardView: View {
    @ObservedObject var flashcardManager: FlashcardManager
    @State private var newQuestion = ""
    @State private var newAnswer = ""
    @Binding var isPresented: Bool
    @State private var addButtonPressed = false
    
    var isInputValid: Bool {
            !newQuestion.isEmpty && !newAnswer.isEmpty
    }
    
    var body: some View {
            VStack {
                Text("Add Flashcard")
                    .font(.title)
                    .padding()
                
                TextField("Enter question", text: $newQuestion)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Enter answer", text: $newAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if addButtonPressed && !isInputValid {
                    Text("Please enter both question and answer")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button("Add") {
                    flashcardManager.addFlashcard(q: newQuestion, a: newAnswer)
                    isPresented = false
                }
                .padding()
                .foregroundColor(.white)
                .background(isInputValid ? Color.blue : Color.gray)
                .cornerRadius(8)
                .disabled(!isInputValid)
                
                Button("Cancel") {
                    isPresented = false
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
            }
            .padding()
        }
}

