//
//  ContentView.swift
//  shapes
//
//  Created by Mathieu Dubart on 15/08/2023.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

// ----- InsettableShape hérite du protocol Shape donc on n'a pas besoin de rajouter la conformité à Shape
struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustement = Angle.degrees(90)
        let modifiedStartAngle = startAngle - rotationAdjustement
        let modifiedEndAngle = endAngle - rotationAdjustement
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStartAngle, endAngle: modifiedEndAngle, clockwise: !clockwise)
        
        return path
    }
    
    // ----- ici on rajoute une méthode qui nous permet de créer de l'inset
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
}

// ----- Shape mesure les coordonnées en partant du coin bas gauche

struct ContentView: View {
    var body: some View {
        /*
        Triangle()
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
         */
        
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        // ----- .strokeBorder() permet de faire une bordure vers l'intérieur pour que ça ne dépasse pas de la vue.
        // ----- mais le modifier n'est pas applicable sur la shape Arc parcequ'elle n'est pas conforme au protocol InsettableShaped
        // ----- donc on la rend conforme et on lui crée une méthode inset()
            .strokeBorder(.blue, lineWidth: 40)
    }
}

#Preview {
    ContentView()
}
