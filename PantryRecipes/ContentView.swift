//
//  ContentView.swift
//  PantryRecipes
//
//  Created by Jovanny Vasquez on 12/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            //Title
            Text("Welcome to Pantry Recipes")
                .font(.title)
                .padding()
            
            //Use imagepicker
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
            }
            
            //Button for taking a picture
            Button(action:  {
                showImagePicker = true
            }) {
                Text("Take Picture")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage, sourceType: .camera)
        }
    }
}

#Preview {
    ContentView()
}
