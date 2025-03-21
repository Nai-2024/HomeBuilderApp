//
//  GalleryView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-03-08.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var hoveredIndex: Int? = nil  // Track hover index
    @State private var appear = false  // Track when view should animate in
    
    let data = BlackBoxData.shared
    
    var body: some View {
        NavigationStack { // Ensure navigation works
            ZStack {
                Rectangle()
                    .fill(Color(red: 39/255, green: 37/255, blue: 37/255))
                    .ignoresSafeArea()
                
                VStack {
                    HeaderSection()
                        .padding(.bottom, -8)
                    
                    ScrollView {
                        BannerSection()
                        
                        VStack {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                                ForEach(data.cityNames.indices, id: \.self) { index in
                                    let city = data.cityNames[index]
                                    
                                    NavigationLink(destination: data.getDestinationView(for: city)) {
                                        ZStack {
                                            Image(data.getFirstImage(for: city)) // Get first image dynamically
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 180, height: 180)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle().stroke(Color.orange, lineWidth: 2)
                                                )
                                                .scaleEffect(hoveredIndex == index ? 1.05 : 1.0)
                                                .animation(.easeInOut(duration: 0.2), value: hoveredIndex)
                                                .onHover { isHovering in
                                                    hoveredIndex = isHovering ? index : nil
                                                }
                                                // Animation: slide from left and right when the view appears
                                                .offset(x: appear ? 0 : -UIScreen.main.bounds.width) // Initially off-screen to the left
                                                .animation(.easeOut(duration: 0.7).delay(Double(index) * 0.1), value: appear)
                                            
                                            Text(city)
                                                .font(.headline)
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding(6)
                                                .clipShape(Capsule())
                                                .position(x: 90, y: 150)
                                                // Animation: slide from right when the view appears
                                                .offset(x: appear ? 0 : UIScreen.main.bounds.width) // Initially off-screen to the right
                                                .animation(.easeOut(duration: 0.7).delay(Double(index) * 0.1), value: appear)
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle()) // Makes sure full area is clickable
                                }
                            }
                            .padding()
                            
                            FooterView()
                        }
                    }
                }
            }
            .onAppear {
                appear = true // Trigger the animation when the view appears
            }
        }
    }
}

#Preview {
    GalleryView()
}


/*
import SwiftUI

struct GalleryView: View {
    
    @State private var hoveredIndex: Int? = nil  // Track hover index
    
    let data = BlackBoxData.shared
    var body: some View {
        NavigationStack{ // Ensure navigation works
            ZStack {
                Rectangle()
                    .fill(Color(red: 39/255, green: 37/255, blue: 37/255))
                    .ignoresSafeArea()
                
                VStack {
                    HeaderSection()
                        .padding(.bottom, -8)
                    
                    ScrollView {
                        BannerSection()
                        
                        VStack {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                                ForEach(data.cityNames.indices, id: \.self) { index in
                                    let city = data.cityNames[index]
                                    NavigationLink(destination: data.getDestinationView(for: city)) {
                                        ZStack {
                                            Image(data.getFirstImage(for: city)) // Get first image dynamically
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 180, height: 180)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle().stroke(Color.orange, lineWidth: 2)
                                                )
                                                .scaleEffect(hoveredIndex == index ? 1.05 : 1.0)
                                                .animation(.easeInOut(duration: 0.2), value: hoveredIndex)
                                                .onHover { isHovering in
                                                    hoveredIndex = isHovering ? index : nil
                                                }
                                            
                                            Text(city)
                                                .font(.headline)
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding(6)
                                                .clipShape(Capsule())
                                                .position(x: 90, y: 150)
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle()) // Makes sure full area is clickable
                                }
                            }
                            .padding()
                            
                            FooterView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GalleryView()
}
*/
