//
//  GalleryView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-03-08.
//
import SwiftUI

struct GalleryView: View {
    
    @State private var hoveredIndex: Int? = nil  // Track hover index
    
    let data = BlackBoxData.shared
    
    //  let cityNames = ["Toronto", "Vaughan", "Markham", "Oakville", "Oshawa", "North York"]
    
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




/*import SwiftUI
 
 struct GalleryView: View {
 
 @State private var selectedImages: [String] = []
 @State private var showTabView = false
 
 let blackBoxData = BlackBoxData() // Create an instance of BlackBoxData
 @State private var hoveredIndex: Int? = nil  // Track hover index
 
 let cityNames = ["Toronto", "Vaughan", "Markham", "Oakville", "Oshawa", "North York"]
 
 var body: some View {
 ZStack {
 // Background color
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
 ForEach(0..<cityNames.count, id: \.self) { index in
 ZStack {
 Image(cityNames[index]) // Use city name as image name
 .resizable()
 .scaledToFill()
 .frame(width: 180, height: 180)
 .clipShape(Circle()) // Circular images
 .overlay(
 Circle()
 .stroke(Color.orange, lineWidth: 2)
 )
 .scaleEffect(showTabView ? 0.85 : 1.0) // Slight shrink effect on tap
 .animation(.easeInOut(duration: 0.2), value: showTabView)
 
 .onTapGesture {
 self.selectedImages = getImageSet(for: cityNames[index])
 self.showTabView = true
 }
 
 // Overlay City Name on Image
 Text(cityNames[index])
 .font(.headline)
 .bold()
 .foregroundColor(.white)
 .padding(6)
 .background(Color.black.opacity(0.6))
 .clipShape(Capsule())
 .position(x: 90, y: 150)
 }
 }
 }
 .padding()
 
 FooterView()
 }
 }
 }
 }
 .sheet(isPresented: $showTabView) {
 ImageTabView(images: selectedImages)
 }
 }
 
 // Function to get images from BlackBoxData
 private func getImageSet(for city: String) -> [String] {
 switch city {
 case "Toronto": return blackBoxData.torontoImages
 case "Vaughan": return blackBoxData.vaughanImages
 case "Markham": return blackBoxData.markhamImages
 case "Oakville": return blackBoxData.oakvilleImages
 case "Oshawa": return blackBoxData.oshawaImages
 case "North York": return blackBoxData.northYorkImages
 default: return []
 }
 }
 }
 
 // TabView to display images in full-screen
 struct ImageTabView: View {
 let images: [String]
 
 var body: some View {
 TabView {
 ForEach(images, id: \.self) { imageName in
 Image(imageName)
 .resizable()
 .scaledToFit()
 }
 }
 .tabViewStyle(PageTabViewStyle())
 }
 }
 
 #Preview {
 GalleryView()
 }
 */
