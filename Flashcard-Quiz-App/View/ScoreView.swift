//
//  ScoreView.swift
//  Flashcard-Quiz-App
//
//  Created by Maria Ehab on 19/03/2024.
//

import SwiftUI

struct ScoreView: View {
    var score: Int
    var totalQuestions: Int
    var retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text("Quiz Completed!")
                .font(.title)
                .padding()
            
            Text("Your Score:")
                .font(.headline)
                .padding()
            
            Text("\(score) / \(totalQuestions)")
                .font(.largeTitle)
                .foregroundColor(Double(score) >= Double(totalQuestions) / 2.0 ? .green : .red)
                .padding()
            
            if Double(score) / Double(totalQuestions) >= 0.5 {
                Text("Congratulations! You've completed the quiz successfully.")
                    .font(.headline)
                    .padding()
            } else {
                Button("Try Again") {
                    retryAction()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
            }
        }
        .navigationBarTitle("Quiz Score")
    }
}

