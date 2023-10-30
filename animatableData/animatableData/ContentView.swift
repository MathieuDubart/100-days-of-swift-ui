//
//  ContentView.swift
//  animatableData
//
//  Created by Mathieu Dubart on 15/08/2023.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get {insetAmount}
        set {insetAmount = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}


struct ContentView: View {
    @State private var insetAmount = 50.0
    var body: some View {
        VStack {
            Trapezoid(insetAmount: insetAmount)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    withAnimation{
                        insetAmount = Double.random(in: 10...100)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
