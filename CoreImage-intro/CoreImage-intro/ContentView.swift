//
//  ContentView.swift
//  Instafilter
//
//  Created by Mathieu Dubart on 06/09/2023.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
        .padding()
    }
    
    func loadImage() {
        // ----- image = Image("mario")
        // ----- Image() is a view
        // ----- but it also find the image "mario" in the catalog and load it
        // ----- or search and load for SF Symbols
        // ----- mais on ne peut que appliquer différents modifiers dessus (basic swift ui filters (brightness, saturation, ....)) pour les rendre.
        // ----- iOS met à disposition 3 types d'images différents avec lesquels on doit travailler (tous) quand on utilise CoreImage.
        // ----- Elles ont toutes l'air similaires mais il y a des subtilités entre chacunes qui sont importantes et doivent être correctement utilisées.
        // ----- Le premier est UI Image, elle peut charger tout type d'image (PNG, JPG, svg....) et provient de UI Kit.
        // ----- Le deuxième est CG Image (CG stands for CoreGraphics) qui est un array à deux dimensions contenant des pixels et notre image rajoute pleins de fonctionnnalités par dessus CG Image.
        // ----- Le dernier type est CI Image (pour CoreImage) et elle contient toutes les informations requises pour produire une image mais ne les transforme pas en pixels tant qu'on ne le lui demande pas.
        // ----- c'est trois types ne sont que de la donnée, elles ne peuvent pas être présentées directement dans une view.
        // ----- par contre on peut les manipuler comme on veut et ensuite présenter le résultat à l'aide d'une view Image().
        
        // ----- on commence par définir une image de départ qu'on récupère avec UIImage() (si il ne la trouve pas, il sort de la fonctionà-)
        guard let inputImage = UIImage(named: "mario") else { return }
        // ----- puis on la convertie en CIImage()
        let beginImage = CIImage(image: inputImage)
        
        // ----- ensuite on créé un context
        let context = CIContext()
        
        // ----- on applique un filtre sur notre image
        // let currentFilter = CIFilter.sepiaTone()
        // let currentFilter = CIFilter.pixellate()
        // let currentFilter = CIFilter.crystallize()
        let currentFilter = CIFilter.crystallize()
        currentFilter.inputImage = beginImage
        let amount = 1.0
        
        // ----- on demande au filtre que l'on utilise quelles sont ses input keys
        let inputKeys = currentFilter.inputKeys
        
        // ----- if you have a key for intensity
        if inputKeys.contains(kCIInputIntensityKey) {
            // ----- set our amount as value for this key (we inject it dynamically
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        
        // ----- same for radius
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
            currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        }
        
        // ----- and for scale
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        
        // ----- puis on récupère l'image avec le filtre dessus (on récupère une CIImage()).
        guard let outputImage = currentFilter.outputImage else { return }
        
        // ----- Ensuite si on arrive à lire outputImage
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            // ----- on la convertie en UIImage
            let uiImage = UIImage(cgImage: cgImage)
            // ----- puis en view Image() pour l'afficher
            image = Image(uiImage: uiImage)
        }
        
    }
}

#Preview {
    ContentView()
}
