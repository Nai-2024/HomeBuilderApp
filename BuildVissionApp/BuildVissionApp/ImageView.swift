//
//  ImageView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-14.
//

/*
import SwiftUI

struct ImageView: View {
    
    @State private var selectedButton: String? = nil  // Track selected button
    @State private var showImage = false  // State variable to toggle image visibility
    
    let buttons = ["Btn1", "Btn2", "Btn3", "Btn4", "Btn5", "Btn6"]
    let images = ["image1", "image2", "image3", "image4", "image5", "image6"] // Ensure these exist in Assets
  

    var body: some View {
        
        VStack {
            if showImage {
                Image("Image1") // Replace with your image name
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 300) // Make HStack fill entire space
                    .foregroundColor(.yellow)
            }

            Button("Btn1") {
                showImage.toggle() // Toggle the image visibility
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
        ImageView()
    }

*/
/*
import SwiftUI

struct ImageView: View {
    @State private var selectedButton: String = ""  // Track selected button
    
    let buttons = ["Btn1", "Btn2", "Btn3", "Btn4", "Btn5", "Btn6"]
    let images = ["image1", "image2", "image3", "image4", "image5", "image6"] // Ensure these exist in Assets

        var body: some View {
            VStack {
                // Display the corresponding image based on the selected button
                Image(getImageName(for: selectedButton))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                HStack(spacing: 20) {
                    Button("Btn1") {
                        selectedButton = "Btn1"
                        
                    }
                    .buttonStyle(.bordered)

                    Button("Btn2") {
                        selectedButton = "Btn2"
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding()
        }

        // Function to return image name based on selected button
        func getImageName(for button: String) -> String {
            switch button {
            case "Btn1": return "image1"
            case "Btn2": return "image2"
            default: return "placeholder" // Default image if no button is selected
            }
        }
    }
*/

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
