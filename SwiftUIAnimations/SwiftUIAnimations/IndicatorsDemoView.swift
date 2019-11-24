//
//  IndicatorsDemoView.swift
//  SwiftUIAnimations
//
//  Created by Jero Sánchez on 24/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct IndicatorsDemoView: View {
    private var isLoading: Bool
    private var progress: CGFloat
    
    init(isLoading: Bool, progress: CGFloat) {
        self.isLoading = isLoading
        self.progress = progress
    }
    
    var body: some View {
        VStack(spacing: 20) {
            SimpleLoadingIndicator(isLoading: isLoading)
            FancyLoadingIndicator(isLoading: isLoading)
            LineIndicator(isLoading: isLoading)
            ProgressIndicator(progress: progress)
            DotsIndicator(isLoading: isLoading)
        }
    }
}

struct SimpleLoadingIndicator: View {
    private var isLoading: Bool
    
    init(isLoading: Bool) {
        self.isLoading = isLoading
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100)
            
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
    }
}

struct FancyLoadingIndicator: View {
    private var isLoading: Bool
    
    init(isLoading: Bool) {
        self.isLoading = isLoading
    }
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.green, lineWidth: 7)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            
        }
        .frame(width: 100, height: 100)
    }
}

struct LineIndicator: View {
    private var isLoading: Bool
    
    init(isLoading: Bool) {
        self.isLoading = isLoading
    }
    
    var body: some View {
        ZStack {
            Text("Loading")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(x: 0, y: -25)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .frame(width: 250, height: 3)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.green, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? 110 : -110, y: 0)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))
        }
        .frame(width: 400, height: 100)
    }
}

struct ProgressIndicator: View {
    var progress: CGFloat
    
    init(progress: CGFloat) {
        self.progress = progress
    }
    
    var body: some View {
        ZStack {
            Text("\(Int(progress * 100))%")
                .font(.system(.title, design: .rounded))
                .bold()
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth:  10)
                
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.green, lineWidth: 10)
                .rotationEffect(Angle(degrees: -90))
        }
        .frame(width: 100, height: 100)
    }
}

struct DotsIndicator: View {
    private var isLoading: Bool
    
    init(isLoading: Bool) {
        self.isLoading = isLoading
    }
    
    var body: some View {
        HStack {
            ForEach(0...4, id: \.self) { index in
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.green)
                    .scaleEffect(self.isLoading ? 1 : 0.3)
                    .animation(Animation.linear(duration: 0.6).repeatForever().delay(0.2 * Double(index)))
            }
        }
        .frame(width: 150, height: 100)
    }
}
