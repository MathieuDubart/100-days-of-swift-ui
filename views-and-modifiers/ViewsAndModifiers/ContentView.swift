//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Mathieu Dubart on 05/08/2023.
//

import SwiftUI

struct CapsuleText: View {
    var text:String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
// on utilise des struct ViewModifier dans des extensions quand on a besoin d'avoir des propriétés personnalisées.

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column) // fonction content qui prend en param row actuelle et column actuelle
                    }
                }
            }
        }
    }
}

// ------- Checkpoint

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeTitle() -> some View {
        modifier(LargeTitle())
    }
}

//----------------------------

struct ContentView: View {
    @State private var useRedText = false
    
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            
            // ------- Checkpoint
            
            Text("Hello, world!")
                .largeTitle()
            
            // --------------------------------------------------------------------
            
            /*
            GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row * 4 + col).circle")
                    .padding()
//                Text("R\(row) C\(col)")
            }
            */
            
            // --------------------------------------------------------------------
            
            /*
            VStack{
                Text("Hello, world!")
                    .modifier(Title())
                
                Text("Hello, world!")
                    .titleStyle()
                
            }
            
            VStack {
                Color.blue
                    .frame(width: 300, height: 200)
                    .watermarked(with: "Your watermark here")
            }
             */
            
            // --------------------------------------------------------------------
            
            /*
            VStack(spacing:10){
                CapsuleText("First")
                    .foregroundColor(.white)
                CapsuleText("Second")
                    .foregroundColor(.yellow)
            }
            */
            
            // --------------------------------------------------------------------
            
            /*
            VStack {
                Button("Hello, world!") {
                    print(type(of: self.body))
                }
                .frame(width: 200, height: 200)
                .background(.red)
                
                Text("some text")
                    .padding()
                    .background(.red)
                    .padding()
                    .background(.blue)
                    .padding()
                    .background(.green)
                    .padding()
                    .background(.yellow)
            }
             */
            
            // --------------------------------------------------------------------
            
            /*
            VStack {
                Button("Hello, world!") {
                    useRedText.toggle()
                }
                .foregroundColor(useRedText ? .red : .blue)
            }
            */
            
            // --------------------------------------------------------------------
            
            /*
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
                    .foregroundColor(useRedText ? .red : .blue)
            }
            .font(.title)
             */
            
            // --------------------------------------------------------------------
            
            /*
            HStack {
                spells
            }
            */
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
