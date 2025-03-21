//
//  HomeViewClose.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-28.
//

import SwiftUI

struct MenuView: View {
    let mustardYellow = Color(red: 0.85, green: 0.56, blue: 0.0)
    
    var body: some View {
        
        //HeaderView()
        ZStack {
            Color(red: 162/255, green: 162/255, blue: 162/255)
                .edgesIgnoringSafeArea(.all) // extends to edges
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Content Stack
            VStack {
                HeaderView()
                Spacer().frame(height: 20)  // This adds a 10px space between the HeaderView and the text links
                
                // Navigation Links/Text
                VStack(spacing: 30){
                    NavigationLink(destination: HomeView()){
                        Text("Home")
                    }
                    NavigationLink(destination: AboutUsView()){
                        Text("ABOUT US")
                    }
                    NavigationLink(destination: ProjectsView()){
                        Text("PROJECTS")
                    }
                    NavigationLink(destination: GalleryView()){
                        Text("GALLERY")
                    }
                    NavigationLink(destination: ContactUsView()){
                        Text("CONTACT US")
                    }
                }
                .foregroundColor(mustardYellow)
                .font(.system(size: 30))
                .bold()
                .shadow(color: .black.opacity(0.7), radius: 0, x: 2, y: 2) // Stronger shadow
                
                Spacer() // Pushes content up if needed
                
                SocialMediaIconsView()
                    .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    MenuView()
}
