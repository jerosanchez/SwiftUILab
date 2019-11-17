//
//  ContentView.swift
//  SwiftUIScrollView
//
//  Created by Jero Sánchez on 17/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 5) {
            HeaderView()
            CarouselView()
            Spacer()
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Monday, Aug 20".uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("Your Reading")
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            .padding([.horizontal])
            
            Spacer()
        }
    }
}

struct ListView: View {
    var body: some View {
        ScrollView {
            VStack {
                CardView(
                    imageName: "swiftui-button",
                    category: "SwiftUI",
                    heading: "Drawing a Border with Rounded Corners",
                    author: "Simon Ng")
                
                CardView(
                    imageName: "macos-programming",
                    category: "macOS",
                    heading: "Building a Simple Editing App",
                    author: "Gabriel Theodoropoulos")
                
                CardView(
                    imageName: "flutter-app",
                    category: "Flutter",
                    heading: "Building a Complex Layout with Flutter",
                    author: "Lawrence Tan")
                
                CardView(
                    imageName: "natural-language-api",
                    category: "iOS",
                    heading: "What's New in Natural Language API",
                    author: "Sai Kambampati")
            }
        }
    }
}

struct CarouselView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                CardView(
                    imageName: "swiftui-button",
                    category: "SwiftUI",
                    heading: "Drawing a Border with Rounded Corners",
                    author: "Simon Ng")
                    .frame(width: 300)
                
                CardView(
                    imageName: "macos-programming",
                    category: "macOS",
                    heading: "Building a Simple Editing App",
                    author: "Gabriel Theodoropoulos")
                    .frame(width: 300)
                
                CardView(
                    imageName: "flutter-app",
                    category: "Flutter",
                    heading: "Building a Complex Layout with Flutter",
                    author: "Lawrence Tan")
                    .frame(width: 300)
                
                CardView(
                    imageName: "natural-language-api",
                    category: "iOS",
                    heading: "What's New in Natural Language API",
                    author: "Sai Kambampati")
                    .frame(width: 300)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
