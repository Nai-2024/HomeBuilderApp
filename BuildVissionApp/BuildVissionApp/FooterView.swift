//
//  FooterView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-28.
//

import SwiftUI

struct FooterView: View {
    let menuItems = ["HOME", "ABOUT US", "PROJECTS", "GALLERY", "CONTACT US"]
    
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.56, blue: 0.0)
                .edgesIgnoringSafeArea(.bottom)
                .frame(height: 390)
            
            VStack {
                // Top Section (Logo & Social Media)
                HStack(alignment: .top) {  // Align items to the top
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(.leading, 6)
                    
                    Spacer()
                    
                    SocialMediaIconsView()
                        .padding(.trailing, 6)
                }
              
                
                Spacer().frame(height: 23) // Add space between logo section & text
                
                // Quick Links & Address
                HStack {
                    Text("QUICK LINKS")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .underline()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    
                    Text("Address")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .underline()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 73)
                }
                .padding(.bottom, 10)
                
                // Menu Items with Custom Pointer
                HStack(alignment: .top) {
                    // Left-side menu items with pointers
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(menuItems, id: \.self) { item in
                            NavigationLink(destination: destinationView(for: item)) {
                                HStack {
                                    Image("pointer")  // Replace "pointer" with your own image name
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 10, height: 10)  // Adjust pointer size
                                    
                                    Text(item)
                                        .font(.body)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading, 33) // Add padding to the left side
                            }
                        }
                    }
                    .padding(.bottom, -5) // Move menu items up by 5 pixels
                    
                    Spacer()
                    
                    // Right-side Address
                    VStack(alignment: .leading, spacing: 10) {
                        Text("123 Queen St.")
                        Text("East Toronto, ON.")
                        Text("A2B B2A")
                    }
                    .padding(.trailing, 20)
                }
                
                Spacer().frame(height: 30) // Add spacing before the copyright text
                
                // Copyright Section
                VStack {
                    Text("© APEX BUILDERS LUXURY HOME")
                    Text("ALL RIGHTS RESERVED")
                }
                .foregroundColor(.black)
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            }
        }
    }
    
    // Function to return the corresponding view based on the menu item
    func destinationView(for item: String) -> some View {
        switch item {
        case "HOME":
            return AnyView(HomeView()) // Replace with your HomeView()
        case "ABOUT US":
            return AnyView(AboutUsView()) // Replace with your AboutUsView()
        case "PROJECTS":
            return AnyView(ProjectsView()) // Replace with your ProjectsView()
        case "GALLERY":
            return AnyView(GalleryView()) // Replace with your GalleryView()
        case "CONTACT US":
            return AnyView(ContactUsView()) // Replace with your ContactUsView()
        default:
            return AnyView(Text("Page not found")) // Handle unknown cases
        }
    }
}

#Preview {
    FooterView()
}
