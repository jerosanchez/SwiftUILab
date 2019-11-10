//
//  ContentView.swift
//  SwiftUIImage
//
//  Created by Jero Sánchez on 10/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // SF Symbols
        
//        Image(systemName: "cloud.heavyrain")
//            .font(.system(size: 100))
//            .foregroundColor(.blue)
//            .shadow(color: .gray, radius: 10, x: 0, y: 10)
        
        // Custom
        
        Image("paris")
            .resizable()
        
//            .edgesIgnoringSafeArea(.all)
//            .scaledToFill()
        
            .aspectRatio(contentMode: .fit)
//            .frame(width: 300)

//            .aspectRatio(contentMode: .fill)
//            .clipped()
//            .clipShape(Circle())
//            .opacity(0.5)

//            .clipShape(Capsule())
        
            
        // Heart
            
//        .overlay(
//            Image(systemName: "heart.fill")
//                .font(.system(size:100))
//                .foregroundColor(.red)
//                .opacity(0.5)
//        )
        
            
        // Quote
            
        .overlay(
            Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway")
                .fontWeight(.heavy)
                .font(.system(.headline, design: .rounded))
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .padding()
                .opacity(0.8)

            , alignment: .top
        )
        
        
        // Darken
        
//            .frame(width: 300)
//            .overlay(Rectangle()
//                .foregroundColor(.black)
//                .opacity(0.4)
//                .overlay(
//                    Text("Paris")
//                        .font(.largeTitle)
//                        .fontWeight(.black)
//                        .foregroundColor(.white)
//                        .frame(width: 200)
//                )
//        )

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
