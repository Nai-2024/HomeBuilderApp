//
//  North York.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-03-08.
//

import SwiftUI

struct NorthYorkView: View {
    
    let projectImages = ["NY1", "NY2", "NY3", "NY4", "NY5", "NY6", "NY7"]

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
                           // Rectangle()
                             //   .fill(Color(red: 183/255, green: 183/255, blue: 183/255))
                               // .frame(height: 430) // Background with fixed height
                               // .frame(maxWidth: .infinity)

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
    NorthYorkView()
}
