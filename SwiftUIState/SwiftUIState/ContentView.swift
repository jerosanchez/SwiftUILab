//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Jero Sánchez on 23/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    
    @State private var blueCounter = 0
    @State private var greenCounter = 0
    @State private var redCounter = 0
    
    var body: some View {
        
        VStack {
            // Play/Stop button
            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "play.circle.fill" : "stop.circle.fill")
                    .font(.system(size: 150))
                    .foregroundColor(isPlaying ? .green : .red)
            }
            
            // Counter buttons
            
            Text("\(blueCounter + greenCounter + redCounter)")
                .font(.system(size: 150, weight: .bold, design: .rounded))
            
            HStack {
                CounterButton(counter: $blueCounter, color: .blue)
                CounterButton(counter: $greenCounter, color: .green)
                CounterButton(counter: $redCounter, color: .red)
            }
        }
    }
}

struct CounterButton: View {
    @Binding var counter: Int
    
    var color: Color
    
    var body: some View {
        Button(action: {
            self.counter += 1
        }) {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .overlay(
                    Text("\(self.counter)")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
