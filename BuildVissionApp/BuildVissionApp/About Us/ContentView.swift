//
//  ContentView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack { // Use ZStack to layer the background color
            // Background color applied to the entire screen
            Color(red: 39/255, green: 37/255, blue: 37/255)
                .ignoresSafeArea() // Extend background to the edges of the screen
            
            VStack(spacing: 5) {
                HeaderView()
                    .frame(maxWidth: .infinity)
                
                ScrollView {
                    VStack {
                        // Text section
                        Text("Company Background:")
                            .foregroundColor(Color(red: 0.85, green: 0.46, blue: 0.0))
                            .bold().padding(.bottom, 10)
                        
                        Text("AApex Builders is a dynamic construction company established in 1980, specializing in residential and commercial projects, known for its commitment to quality and innovative design. With a focus on custom home building, renovations, and construction management, Apex Builders transforms spaces to meet the unique needs of their clients. The company’s emphasis on craftsmanship and sustainable practices sets them apart in the construction industry, making them a trusted partner for those looking to create or enhance their living and working environments. Their professional team is dedicated to delivering exceptional results, ensuring every project is a true reflection of their clients’ visions and lifestyles. \n\nApex Builders is dedicated to fostering strong relationships with clients through open communication and collaboration. From the initial consultation to project completion, the team works closely with clients to understand their needs and preferences, ensuring a seamless and personalized experience. This client-centric approach not only enhances satisfaction but also encourages innovation, allowing Apex to tackle unique challenges and deliver tailored solutions. As a leader in the industry, Apex Builders continually strives to incorporate the latest trends and technologies, positioning itself as a forward-thinking partner in creating exceptional spaces. ")
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.bottom, 30)
                            .frame(maxWidth: .infinity)
                    }
                    FooterView()
                    
                }
            }
        }
        
    }
}


#Preview {
    ContentView()
}

