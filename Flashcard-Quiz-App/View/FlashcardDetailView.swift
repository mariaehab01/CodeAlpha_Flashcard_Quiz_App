//
//  FlashcardDetailView.swift
//  Flashcard-Quiz-App
//
//  Created by Maria Ehab on 21/03/2024.
//

import SwiftUI

struct FlashcardDetailView: View {
    var flashcard: Flashcard

    var body: some View {
        VStack {
            Text(flashcard.question)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text("Answer: \(flashcard.answer)")
                .font(.headline)
                .padding()
        }
        .navigationBarTitle("Flashcard Details", displayMode: .inline)
    }
}
