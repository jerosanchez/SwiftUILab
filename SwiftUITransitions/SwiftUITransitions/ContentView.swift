//
//  ContentView.swift
//  SwiftUITransitions
//
//  Created by Jero Sánchez on 24/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetail = false
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text(showDetail ? "Hide details" : "Show details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
            )
            
            if showDetail {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Well, here is the detail")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                )
//                .transition(.scale(scale: 0, anchor: .bottom))
                .transition(.offset(x: -600, y: 0))
//                    .transition(.offsetScaleOpacity)
//                    .transition(.asymmetric(
//                        insertion: .offset(x: -600, y: 0),
//                        removal: .scale(scale: 0, anchor: .bottom))
//                    )
            }
        }
        .onTapGesture {
            withAnimation(Animation.spring()) {
                self.showDetail.toggle()
            }
        }
    }
}

// Reuse transition

extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        AnyTransition.offset(x: -600, y: 0)
            .combined(with: .scale)
            .combined(with: .opacity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
