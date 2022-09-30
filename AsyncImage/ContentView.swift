//
//  ContentView.swift
//  AsyncImage
//
//  Created by Sam Davis Omekara  on 9/29/22.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
      self
        .resizable()
        .scaledToFit()
    }
    
    func iconModifier() -> some View {
      self
        .imageModifier()
        .frame(maxWidth: 128)
        .foregroundColor(.yellow)
        .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://images.pexels.com/photos/1486844/pexels-photo-1486844.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
    
    var body: some View {
        // MARK: -1 BASIC
        
        //        AsyncImage(url: URL(string: imageURL))
        //        // default placeholder -> grey block : used for failed/empty phases.
        
        // MARK: -2 SCALE
        //        AsyncImage(url: URL(string: imageURL), scale: 3.0)
        //        // larger the scale, the smaller the image.
        
        // MARK: -3 PLACEHOLDER
        //        AsyncImage(url: URL(string: imageURL)){ image in
        //            image
        //                .imageModifier()
        //
        //        } placeholder: {
        //            Image(systemName: "photo.circle.fill")
        //                .iconModifier()
        //
        //        }
        //        .padding(40)
        //        // Can't add image specific modifiers to the AsyncImage,
        //        // rather we must add them to the specific image instance.
        //
        //        // Avoid duplicated image modifiers by using Image extensions
        //        // (see imagemodifier & iconmodifier)
        
        // MARK: -4 ASYNC IMAGE PHASES
        // To get more control over the AsyncImage,
        // use the ctor that gives you access to each phase
        // PHASES : EMPTY, SUCCESS, FAILURE
//        AsyncImage(url: URL(string: imageURL)){ phase in
//            // SUCCESS: The image successfully loaded
//            // FAILURE: The image failed to load with an error
//            // EMPTY: No image is loaded.
//
//            if let image = phase.image{
//                image.imageModifier()
//            }
//            else if phase.error != nil {
//                Image(systemName: "exclamationmark.triangle.fill")
//                    .iconModifier()
//            }
//            else{
//                Image(systemName: "photo.circle.fill")
//                    .iconModifier()
//            }
//        }
//        .padding(40)
        
        // MARK: -5 ANIMATION
        // Aysnc image phase is an enumeration that keeps track of current download phase
        // To animate the remote image, we need to specify a transaction ppty + transition type
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){ phase in
            switch phase {
            case .success(let image):
                image
                    .imageModifier()
//                    .transition(.move(edge: .leading))
//                    .transition(.slide) // slides from the left
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "exclamationmark.triangle.fill")
                    .iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill")
                    .iconModifier()
                
            @unknown default:
                ProgressView()
            }
            
        }
        .padding(40)
        
        // From iOS15, No third party is needed to load remote images from the internet
        // To load an image, provide its url to the AsyncImage url ppty
        // By default, the image is assumed to have a scale of 1, change by modifying the value
        // of the scale parameter.
        // Can't apply image specific modifiers to AsyncImage. Instead, apply them to the specific
        // image instance.
        // You can replace the default grey view placeholder to your own custom image.
        // You can use return a view that is appropraite view for each phase by using the phase closure
        // ctor.
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
