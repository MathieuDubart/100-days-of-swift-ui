//
//  ImagePicker.swift
//  wrapping-UIViewController
//
//  Created by Mathieu Dubart on 06/09/2023.
//

import PhotosUI
import SwiftUI

// ----- le protocol UIViewControllerRepresentable permet de rendre la structure utilisable dans une view SwiftUI nativement.
struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        // ----- we create a new picker
        var config = PHPickerConfiguration()
        // ----- config.filter = .images only allow to give us images (no live photos, videos...)
        config.filter = .images
        
        // ----- put that into a ViewController
        let picker = PHPickerViewController(configuration: config)
        // ----- and return it.
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
}
