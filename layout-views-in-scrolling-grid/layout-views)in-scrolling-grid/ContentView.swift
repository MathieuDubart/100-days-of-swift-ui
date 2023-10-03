//
//  ContentView.swift
//  layout-views)in-scrolling-grid
//
//  Created by Mathieu Dubart on 14/08/2023.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Row \($0)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
