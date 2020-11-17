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
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                Text("I'm thinking of a number between 1 and 100, Guess what it is!")
                    .font(.title)
                    .padding(.bottom, 20.0)
                
                TextField("Enter your guess here",
                          text: $theUserGuess)
                    .padding(.horizontal, 25.0)
                
                Button("Submit Guess") {
                    // Check the guess
                }
                
                Text("You guessed \(theUserGuess).")
                    .font(.title)
                
                Spacer()
            }
            .navigationBarTitle("Guessing Game")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
