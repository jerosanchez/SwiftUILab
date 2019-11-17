//
//  CardView.swift
//  SwiftUIScrollView
//
//  Created by Jero Sánchez on 17/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var imageName: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 2)
        )
            .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(
            imageName: "swiftui-button",
            category: "SwiftUI",
            heading: "Drawing a Border with Rounded Corners",
            author: "Simon Ng")
    }
}
