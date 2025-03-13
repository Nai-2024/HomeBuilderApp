//
//  ToronotView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-03-03.
//

import SwiftUI

struct TorontoView: View {
    
    let projectImages = ["Toronto1", "Toronto2", "Toronto3", "Toronto4", "Toronto5", "Toronto6", "Toronto7"]

    var body: some View {
        ZStack {
            // Background color at the top
            Rectangle()
                .fill(Color(red: 39/255, green: 37/255, blue: 37/255))
                .frame(maxWidth: .infinity)
                //.padding(.top, 60)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HeaderSection()
                    .padding(.bottom, -8)
                
                ScrollView {
                    BannerSection()
                    
                    VStack {
                        Text("Explore our portfolio to see how we transform visions into reality, creating spaces that are not only beautiful but also functional and sustainable.")
                            .foregroundColor(.white)
                            .padding(10)
                        
                        // TabView for horizontal image scrolling
                        ZStack {
                            TabView {
                                ForEach(projectImages, id: \.self) { image in
                                    Image(image)
                                        .resizable()
                                        //.scaledToFill()
                                        .aspectRatio(contentMode: .fill) // Ensures the image fills the full width
                                        .frame(width: UIScreen.main.bounds.width)
                                        .clipped()
                                        .padding(.top, -30)
                                }
                               
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Adds page dots
                            .frame(height: 420) // Ensures correct height
                        }
                        
                        FooterView()
                            .padding(.top, 5)
                    }
                }
            }
        }
    }
}

#Preview {
    TorontoView()
}


/*
 TabView {
     ForEach(projectImages, id: \.self) { image in
         ZStack {
             Rectangle()
                 .fill(Color(red: 183/255, green: 183/255, blue: 183/255))
                 .frame(height: 430) // Background with fixed height
                 .frame(maxWidth: .infinity)
             
             Image(image) // Display each image from the array
                 .resizable() // Allow the image to resize
                 .scaledToFill() // Scale the image to fill the space
                 .frame(height: 400) // Adjust height to match the background rectangle
                 .clipped() // Clip any part of the image that exceeds the frame
                 .padding(.top, -30)
         }
        // .frame(width: UIScreen.main.bounds.width, height: 430) // Make sure each TabItem fills the screen width and height
     }
 }
 .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)) // Add this for page-style behavior
 .frame(maxWidth: .infinity, maxHeight: 430) // Ensure the TabView takes full width and height
 */
