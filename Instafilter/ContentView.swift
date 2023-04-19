//
//  ContentView.swift
//  Instafilter
//
//  Created by Robert-Dumitru Oprea on 19/04/2023.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button("Select Image") {
                showingImagePicker = true
            }

        }
        
            .padding()
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .onChange(of:inputImage) {_ in
                loadImage()
            }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
