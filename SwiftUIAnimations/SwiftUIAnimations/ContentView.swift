//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Jero Sánchez on 24/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    @State private var isLoading = false
    
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        
        VStack(spacing: 20) {
//            PulsatingHeartButtonView()
            IndicatorsDemoView(isLoading: isLoading, progress: progress)
            MorphingButtonView()

        }
        .onAppear() {
            self.isLoading = true
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                self.progress += 0.05
                if self.progress >= 1.0 {
//                    timer.invalidate()
                    self.progress = 0.0
                }
            }
        }
    }
}

struct MorphingButtonView: View {
    @State private var recordBegins = false
    @State private var recording = false
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: recordBegins ? 30 : 5)
                .frame(width: recordBegins ? 60 : 250, height: 60)
                .foregroundColor(recordBegins ? .red : .green)
                .overlay (
                    Image(systemName: "mic.fill")
                        .font(.system(.title))
                        .foregroundColor(.white)
                        .scaleEffect(recording ? 0.7 : 1)
            )
            
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0, to: recordBegins ? 0 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegins ? 70 : 260, height: 70)
                .foregroundColor(.green)
        }
        .onTapGesture {
            withAnimation(Animation.spring()) {
                self.recordBegins.toggle()
            }
            
        withAnimation(Animation.spring().repeatForever().delay(0.5)) {
                self.recording.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
