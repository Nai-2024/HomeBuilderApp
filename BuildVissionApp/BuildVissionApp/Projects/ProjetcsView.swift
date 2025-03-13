//
//  ProjetcsView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-03-02.
//

import SwiftUI

struct ProjectsView: View {
    let data = BlackBoxData.shared
    
    var body: some View {
        NavigationStack {  // Ensure you are inside a NavigationStack
            ZStack {
                // Background color at the top
                Rectangle()
                    .fill(Color(red: 39/255, green: 37/255, blue: 37/255))
                    .frame(height: .infinity)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 60)
                
                VStack {
                    HeaderSection()
                        .padding(.bottom, -8)
                    
                    ScrollView {
                        BannerSection()
                        VStack {
                            Text("Explore our portfolio to see how we transform visions into reality, creating spaces that are not only beautiful but also functional and sustainable.")
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.bottom, 6)
                            
                            ZStack {
                                // Gray background under the text
                                Rectangle()
                                    .fill(Color(red: 183/255, green: 183/255, blue: 183/255))
                                    .frame(height: 620)
                                    .frame(maxWidth: .infinity)
                                
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                                    ForEach(data.cityNames.indices, id: \.self) { index in
                                        let city = data.cityNames[index]
                                        
                                        // Wrap the entire ZStack with NavigationLink to ensure clickability
                                        NavigationLink(destination: data.getDestinationView(for: city)) {
                                            ZStack {
                                                // Dynamically retrieved image for the city
                                                Image(data.getFirstImage(for: city)) // Get first image dynamically
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 180, height: 180)
                                                    .clipShape(Circle())
                                                    .overlay(
                                                        Circle().stroke(Color.orange, lineWidth: 2) // Border color
                                                    )
                                                
                                                // City Name Overlay
                                                Text(city)
                                                    .font(.headline)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                    //.padding(6)
                                                    .position(x: 90, y: 150) // Position the city name over the image
                                            }
                                        }
                                        .buttonStyle(PlainButtonStyle()) // Make sure it's tappable and doesn't show default button styles
                                    }
                                }
                                .padding(.horizontal, 7)
                            
                            }
                            FooterView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProjectsView()
}




/*
import SwiftUI

struct ProjectsView: View {
    
    let projectImages = ["Toronto1", "Vaughan1", "Markham1", "OA1", "Oshawa1", "NY1"]
    let cityNames = ["Toronto", "Vaughan", "Markham", "Oakville", "Oshawa", "North York"]
    var body: some View {
        ZStack {
            // Background color at the top
            Rectangle()
                .fill(Color(red: 39/255, green: 37/255, blue: 37/255))
                .frame(height: .infinity)
                .frame(maxWidth: .infinity)
                .padding(.top, 60)
            
            VStack {
                HeaderSection()
                    .padding(.bottom, -8)
                
                ScrollView {
                    BannerSection()
                    VStack {
                        Text("Explore our portfolio to see how we trans-form visions into reality, creating spaces that are not only beautiful but also functional and sustainable.")
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.bottom, 20)
                        
                        ZStack{
                            // Gray background under the text
                            Rectangle()
                                .fill(Color(red: 183/255, green: 183/255, blue: 183/255))
                                .frame(height: 620)
                                .frame(maxWidth: .infinity)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 0) {
                                ForEach(0..<projectImages.count, id: \.self) { index in
                                    ZStack {
                                        Image(projectImages[index])
                                            .resizable()
                                            .scaledToFill() // Ensures consistent aspect ratio
                                            .frame(width: 180, height: 180) // Set fixed frame
                                            .clipShape(Circle()) // Makes all images circular
                                            .overlay(
                                                Circle().stroke(Color(red: 0.85, green: 0.56, blue: 0.0), lineWidth: 2) // Custom border color
                                            )
                                        
                                        // Overlay City Name on Image
                                        Text(cityNames[index])
                                            .font(.headline)
                                            .bold()
                                            .foregroundColor(.white)
                                            .padding(6)
                                            .position(x: 90, y: 150) // Adjusts position over the imag
                                        
                                    }
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                            }
                        }
                        FooterView()
                    }
                }
            }
            
        }
    }
}

#Preview {
    ProjectsView()
}

*/
