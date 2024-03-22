//
//  FlashcardManager.swift
//  Flashcard-Quiz-App
//
//  Created by Maria Ehab on 19/03/2024.
//

import Foundation
import SwiftUI

class FlashcardManager : ObservableObject {
    @Published var flashcards: [Flashcard] = []

    func addFlashcard(q: String, a: String) {
        let flashcard = Flashcard(question: q, answer: a)
        flashcards.append(flashcard)
    }

    func deleteFlashcard(_ flashcard: Flashcard) {
        if let index = flashcards.firstIndex(of: flashcard) {
            flashcards.remove(at: index)
        }
    }
}

