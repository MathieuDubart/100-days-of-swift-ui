//
//  ContentView.swift
//  custom-path
//
//  Created by Mathieu Dubart on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path{ path in
            path.move(to: CGPoint(x:200, y:100))
            path.addLine(to: CGPoint(x:100, y:300))
            path.addLine(to: CGPoint(x:300, y:300))
            path.addLine(to: CGPoint(x:200, y:100))
            path.closeSubpath()
        }
        .fill(.blue)
        .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

#Preview {
    ContentView()
}
