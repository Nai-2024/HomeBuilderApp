//
//  ProjetcsView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-03-02.
//

import SwiftUI

struct ProjectsView: View {
    
    let projectImages = ["Toronto", "Vaughan", "Markham", "Oakville", "Oshawa", "North York"]
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
                HeaderView()
                
                ScrollView {
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
                                            .scaledToFit()
                                            .frame(height: 180)
                                            .cornerRadius(10)
                                        
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
