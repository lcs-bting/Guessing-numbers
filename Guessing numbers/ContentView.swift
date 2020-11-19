//
//  ContentView.swift
//  Guessing numbers
//
//  Created by Bill Ting on 2020-11-17.
//

import SwiftUI

struct ContentView: View {
    
    // The guess made by the user
    @State private var theUserGuess = ""
    
    //The number that the user should guess
    @State private var target = Int.random(in: 1...100)
    
    // feedback to the user
    @State private var feedback = ""
    
    // Keep track of whether the game is over
    @State private var gameOver = false
    
    var body: some View {
        
        VStack {
            
            Text("Guessing Game")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Form{
                Section{
                    Text("I'm thinking of a number between 1 and 100, Guess what it is!")
                        .font(.title)
                        .padding(.bottom, 20.0)
                }
                Section{
                    TextField("Enter your guess here",
                              text: $theUserGuess)
                        .padding(.horizontal, 25.0)
                    
                    Button(action: {
                        // Check the guess
                        checkGuess()
                    }) {
                        Text("Check my guess")
                    }
                    .padding(.vertical)
                }
                
                Section(header: Text("Hint")){
                    
                }
                
                //Only show output once input has been provided
                if theUserGuess.count > 0 {
                    
                    Text("you guessed \(theUserGuess)")
                        .font(.title)
                        .padding(.bottom)
                    
                    Text("\(feedback)")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                }
                
                if gameOver {
                    Button(action: {
                        resetGame()
                    }) {
                        Text("Reset game")
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    // Check what the user guessed against the target
    func checkGuess() {
        // See if the user gave us an integer in the expexted range
        guard let givenInteger = Int(theUserGuess) else {
            feedback = "Please provide an integer between 1 and 100."
            return
        }
        guard givenInteger > 0, givenInteger < 101 else {
            feedback = "Please provide an integer between 1 and 100."
            return
        }
        
        // Ls this guess correct?
        if givenInteger < target {
            feedback = "Guess higher!"
        } else if givenInteger == target {
            feedback = "You've got it"
            gameOver = true
        } else {
            feedback = "Guess lower!"
        }
        
    }
    
    // Reset the game
    func resetGame() {
        
        // Pick a new random number
        target = Int.random(in: 1...100)
        
        //clear out the old feedback from the prior round
        theUserGuess = ""
        feedback = ""
        
        // the new game... is not over
        gameOver = false
        
    }
    
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
