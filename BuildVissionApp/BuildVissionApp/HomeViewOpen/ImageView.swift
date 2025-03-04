//
//  ImageView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-14.
//

import SwiftUI

struct ImageView: View {
    // Array of image names (ensure these match exactly with the names in Assets)
    let images = ["Image1", "Image2", "Image3", "Image4", "Image5", "Image6"]
    
    @State private var currentIndex = 0 // Track selected image index

    var body: some View {
        VStack {
            // Scrollable Image Carousel with Rectangles Positioned 10px Below the Image
            TabView(selection: $currentIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    ZStack(alignment: .bottom) {
                        // Background Image
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width)
                            .padding()
                        
                        // Rectangles Positioned 10px Below the Image
                        HStack(spacing: 10) {
                            ForEach(0..<images.count, id: \.self) { rectIndex in
                                Rectangle()
                                    .frame(width: 40, height: 10)
                                    .foregroundColor(currentIndex == rectIndex ? Color.orange : Color.gray.opacity(0.5)) // Highlight selected one
                                    .cornerRadius(5)
                            }
                        }
                        .padding(.top, 10) // Exactly 10px below the image
                    }
                    .tag(index) // Assign tag to track selected index
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // No default page indicators
        }
    }
}

#Preview {
    ImageView()
}
