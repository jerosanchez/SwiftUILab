//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by Jero Sánchez on 17/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TextButtonView()
            ImageButtonView()
            GradientButtonView()
            RotatingPlusButtonView()
        }
    }
}

struct TextButtonView: View {
    
    var body: some View {
        Button(action: {
            print("Button tapped")
        }) {
            Text("Press me!")
                .fontWeight(.bold)
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .font(.title)
                .cornerRadius(40)
                
                .padding(10)
                //                .border(Color.purple, width: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.purple, lineWidth: 5)
            )
        }
    }
}

struct ImageButtonView: View {
    
    var body: some View {
        Button(action: {
            print("Delete button tapped")
        }) {
            HStack {
                Image(systemName: "trash")
//                    .padding()
                    .font(.largeTitle)
//                    .background(Color.red)
//                    .clipShape(Circle())
//                    .foregroundColor(.white)
        
                Text("Delete")
                    .fontWeight(.semibold)
                    .font(.title)
                
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)

        }
    }
}

struct GradientButtonView: View {
    var body: some View {
        Button(action: {
            print("Gradient button tapped")
        }) {
            Text("Gradient")
                .fontWeight(.semibold)
                .font(.title)
        }
        .buttonStyle(GradientButtonStyle())
    }
}

struct GradientButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
            .padding(.horizontal, 20)
        
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct RotatingPlusButtonView: View {
    var body: some View {
        Button(action: {
            print("Plus button tapped")
        }) {
            Image(systemName: "plus.circle.fill")
                .padding()
                .font(.largeTitle)
                .foregroundColor(.purple)
                .clipShape(Circle())
        }
        .buttonStyle(RotatingButtonStyle())
    }
}

struct RotatingButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .rotationEffect(configuration.isPressed ? .degrees(45) : .degrees(0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
