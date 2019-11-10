//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Jero Sánchez on 10/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 10) {
            
            HeaderView()
            
            HStack(spacing: 15) {
                PricingView(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                
                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    
                    BannerView(messageText: "Best for designers", offset: 87)
                }
            }
            .padding(.horizontal)
            
            ZStack {
                PricingView(iconName: "wand.and.rays", title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue: 70/255))
                    .padding()
                
                BannerView(messageText: "Perfect for teams with 20 members", offset: 107)
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {
    
    var iconName: String?
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var bannerText: String?
    
    init(iconName: String? = nil, title: String, price: String, textColor: Color, bgColor: Color, bannerText: String? = "") {
        self.iconName = iconName
        self.title = title
        self.price = price
        self.textColor = textColor
        self.bgColor = bgColor
        self.bannerText = bannerText
    }
    
    var body: some View {
        
        ZStack {
            
            VStack {
                iconName.map {
                    Image(systemName: $0)
                        .font(.largeTitle)
                        .foregroundColor(textColor)
                }
                
                Text(title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(textColor)
                Text(price)
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(textColor)
                Text("per month")
                    .font(.headline)
                    .foregroundColor(textColor)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                
            .padding(40)
            .background(bgColor)
            .cornerRadius(10)
            
            
            
        }
    }
}

struct BannerView: View {
    
    var messageText: String
    var offset: CGFloat
    
    var body: some View {
        Text(messageText)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green:183/255, blue: 37/255))
            .offset(x: 0, y: offset)
    }
}
