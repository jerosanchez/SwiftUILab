//
//  ContentView.swift
//  SwiftUIShapes
//
//  Created by Jero Sánchez on 23/11/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
        
            HStack {
                // Rectangle
                Path() { path in
                    path.move(to: CGPoint(x: 20, y: 20))
                    path.addLine(to: CGPoint(x: 100, y: 20))
                    path.addLine(to: CGPoint(x: 100, y: 100))
                    path.addLine(to: CGPoint(x: 20, y: 100))
                    path.closeSubpath()
                }
                    //        .fill(Color.green)
                    .stroke(Color.green, lineWidth: 10)
                
                // Arc
                Path() { path in
                    path.move(to: CGPoint(x: 100, y: 100))
                    path.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 90), clockwise: true)
                }
                .fill(Color.green)
            }
            
            // Dome
            ZStack {
                Path() { path in
                    path.move(to: CGPoint(x: 20, y: 60))
                    path.addLine(to: CGPoint(x: 40, y: 60))
                    path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                    path.addLine(to: CGPoint(x: 230, y: 60))
                    path.addLine(to: CGPoint(x: 230, y: 100))
                    path.addLine(to: CGPoint(x: 20, y: 100))
                }
                .fill(Color.purple)
                
                // fill() and stroke() cannot be used together;
                // we replicate the shape within a ZStack
                Path() { path in
                    path.move(to: CGPoint(x: 20, y: 60))
                    path.addLine(to: CGPoint(x: 40, y: 60))
                    path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
                    path.addLine(to: CGPoint(x: 230, y: 60))
                    path.addLine(to: CGPoint(x: 230, y: 100))
                    path.addLine(to: CGPoint(x: 20, y: 100))
                    path.closeSubpath()
                }
                .stroke(Color.black, lineWidth: 5)
            }
            
            HStack {
                
                // Pie chart
                PieChart()
                    .frame(width: 200, height: 200)

                
                Text("A domed shape")
                    .foregroundColor(.white)
                    .bold()
                    .background(Dome().fill(Color.red))
                    .frame(width: 200, height: 200)
            }
            
            Path() { path in
                path.move(to: CGPoint(x: 50, y: 50))
                path.addQuadCurve(to: CGPoint(x: 350, y: 50), control: CGPoint(x: 200, y: 10))
                
                // Option 1
//                path.addLine(to: CGPoint(x: 200, y: 40))
//                path.addLine(to: CGPoint(x: 0, y: 40))
                
                // Option 2
                path.addRect(CGRect(x: 50, y: 50, width: 300, height: 60))
                
            }
            .fill(Color.green)
            
            HStack {
                
                ProgressChart(progress: 0.85)
                    .frame(width: 200, height: 100)
                
                DonutChart()
                    .frame(width: 200, height: 100)
                
            }
            
            Spacer()
        }
    }
}

struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width / 2, y: -20))
        path.move(to: CGPoint(x: 0, y: rect.size.height))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: rect.size.height), control: CGPoint(x: rect.size.width / 2, y: rect.size.height + 20))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}

struct PieChart: View {
    var body: some View {
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 190), clockwise: true)
            }
            .fill(Color(.systemYellow))
            
            Path() { path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: Angle(degrees: 190.0), endAngle: Angle(degrees: 110), clockwise: true)
            }
            .fill(Color(.systemTeal))
            
            Path() { path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: Angle(degrees: 110.0), endAngle: Angle(degrees: 90.0), clockwise: true)
            }
            .fill(Color(.systemBlue))
            
            ZStack {
                Path() { path in
                    path.move(to: CGPoint(x: 100, y: 100))
                    path.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: Angle(degrees: 90.0), endAngle: Angle(degrees: 360.0), clockwise: true)
                }
                .fill(Color(.systemPurple))
                .offset(x: 10, y: 10)
                    
                Path() { path in
                    path.move(to: CGPoint(x: 100, y: 100))
                    path.addArc(center: CGPoint(x: 100, y: 100), radius: 50, startAngle: Angle(degrees: 90.0), endAngle: Angle(degrees: 360.0), clockwise: true)
                    path.closeSubpath()
                }
                .stroke(Color(red: 52/255, green: 52/255, blue: 122/255), lineWidth: 5)
                .offset(x: 10, y: 10)
                .overlay(
                    Text("25%")
                        .font(.system(.caption, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 10, y: 45)
                )
            }
        }
    }
}

struct ProgressChart: View {
    
    private var purpleGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color (red: 207/255, green: 150/255, blue: 207/255),
            Color(red: 107/255, green: 116/255, blue: 179/255)
        ]),
        startPoint: .trailing,
        endPoint: .leading)
    
    var progress: CGFloat
    
    init(progress: CGFloat = 0.0) {
        self.progress = progress
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 10)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(purpleGradient, lineWidth: 10)
                
                .overlay(
                    VStack {
                        Text("\(String(format: "%.0f", progress * 100))%")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(Color(.systemGray))
                        Text("complete")
                            .font(.system(size: 12, design: .rounded))
                            .bold()
                            .foregroundColor(Color(.systemGray))
                        
                    }
            )
        }
    }
}

struct DonutChart: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.4)
                .stroke(Color(.systemBlue), lineWidth: 40)
            
            Circle()
                .trim(from: 0.4, to: 0.6)
            .stroke(Color(.systemTeal), lineWidth: 40)
            
            Circle()
                .trim(from: 0.6, to: 0.75)
            .stroke(Color(.systemPurple), lineWidth: 40)
            
            Circle()
                .trim(from: 0.75, to: 1)
                .stroke(Color(.systemYellow), lineWidth: 46)
            .overlay(
                Text("25%")
                    .font(.system(.headline, design: .rounded))
                .bold()
                    .foregroundColor(.white)
                    .offset(x: 42, y: -25)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
