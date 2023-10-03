//
//  ContentView.swift
//  ImagePaint
//
//  Created by Mathieu Dubart on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("mario"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.003), lineWidth: 50)
            .frame(width: 300, height: 200)
    }
}

#Preview {
    ContentView()
}
