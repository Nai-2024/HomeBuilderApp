//
//  FunctionsView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-14.
//


import SwiftUI

struct FunctionsView: View {
    @State private var selectedButton: String? = nil  // Track selected button
    
    let buttons = ["Btn1", "Btn2", "Btn3", "Btn4", "Btn5", "Btn6"]
    let images = ["image1", "image2", "image3", "image4", "image5", "image6"] // Ensure these exist in Assets

    var body: some View {
        VStack {
            // Display the corresponding image for the selected button
            if let selectedButton = selectedButton,
               let index = buttons.firstIndex(of: selectedButton) {
                Image(images[index])  // Show the matching image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }

            HStack(spacing: 20) {
                ForEach(buttons.indices, id: \.self) { index in
                    let buttonName = buttons[index]

                    Button(action: {
                        selectedButton = buttonName // Update selected button
                    }) {
                        ZStack {
                            if selectedButton == buttonName {
                                Color(red: 0.85, green: 0.56, blue: 0.0) // Highlight button when selected
                            } else {
                                Color.clear
                            }

                            Image(buttonName) // Button image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .opacity(selectedButton == buttonName ? 0 : 1)
                        }
                        .frame(width: 50, height: 50) // Adjusted for better tap area
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle()) // Removes default button styling
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionsView()
    }
}
