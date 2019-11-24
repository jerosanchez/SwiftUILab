//
//  PulsatingHeartButtonView.swift
//  SwiftUIAnimations
//
//  Created by Jero Sánchez on 24/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct PulsatingHeartButtonView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(circleColorChanged ? Color(.systemGray5) : .red)
            
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 50))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
        }
        .onTapGesture {
                // explicit animation
                withAnimation(.spring(response: 0.3, dampingFraction: 0.2, blendDuration: 0.3)) {
                    self.circleColorChanged.toggle()
                    self.heartColorChanged.toggle()
                }
                
                self.heartSizeChanged.toggle()
        }
    }
}
