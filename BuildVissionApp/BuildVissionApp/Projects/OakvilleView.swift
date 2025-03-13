//
//  Oakville.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-03-08.
//

import SwiftUI

struct OakvilleView: View {
    let projectImages = ["OA1", "OA2", "OA3", "OA4", "OA5", "OA6", "OA7"]

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
    OakvilleView()
}
