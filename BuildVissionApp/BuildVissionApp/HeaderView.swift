//
//  HeaderView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-28.
//

/*
import SwiftUI

struct HeaderView: View {
    
    let mustardYellow = Color(red: 0.85, green: 0.56, blue: 0.0)
    
    var body: some View {
        VStack(spacing: 0) { // Ensures everything stacks properly
            
            // Existing Header Section
            ZStack {
                Color(red: 0.85, green: 0.85, blue: 0.85) // Light gray
                    .frame(height: 100)
                
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110)
                        .offset(y: 5)
                    
                    Spacer()
                    
                    Text("READY TO BUILD YOUR HOME")
                        .font(.footnote)
                        .bold()
                        .frame(width: 210, height: 50)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .scaledToFit()
                        .background(mustardYellow)
                        .cornerRadius(3)
                    
                    Spacer()
                    
                    VStack {
                        Image("HumbugerIcon1").renderingMode(.template)
                        Image("HumbugerIcon1").renderingMode(.template)
                        Image("HumbugerIcon1").renderingMode(.template)
                    }
                    .frame(width: 50, height: 10)
                    .bold()
                    .foregroundColor(mustardYellow)
                }
                .padding(6)
            }
            
            // New ZStack Section with Background Image & Overlay Text
            ZStack(alignment: .bottomLeading) {
                Image("Main")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 240)
                
                Text("AWARD WINNING LUXURY\nCUSTOM HOME BUILDER")
                    .font(.system(size: 14)) // Slightly larger for better visibility
                    .fontWeight(.bold)
                    .padding(6) // More padding for better readability
                    .background(mustardYellow) // Background color
                    .cornerRadius(6)
                    .foregroundColor(.white) // Better contrast
                    .padding(.bottom, 34)
                    .padding(.leading, 10)
            }
        }
    }
}

#Preview {
    HeaderView()
}

*/

import SwiftUI

struct HeaderView: View {
    let mustardYellow = Color(red: 0.85, green: 0.56, blue: 0.0)

    var body: some View {
        VStack (spacing: 0){
            // Section 1: Header (Logo, Text, and Icons)
            HeaderSection()
            
            // Section 2: Banner (Background Image and Text Overlay)
            BannerSection()
        }
    }
}

// Section 1: Header (Logo, Text, and Icons)
struct HeaderSection: View {
    let mustardYellow = Color(red: 0.85, green: 0.56, blue: 0.0)
    
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.85, blue: 0.85) // Light gray
                .frame(height: 100)
            
            HStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 95, height: 95)
                    .offset(y: 18)
                
                Spacer()
                
                Text("READY TO BUILD YOUR HOME")
                    .font(.footnote)
                    .bold()
                    .frame(width: 210, height: 50)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .scaledToFit()
                    .background(mustardYellow)
                    .cornerRadius(3)
                
                Spacer()
                
                VStack {
                    Image("HumbugerIcon1").renderingMode(.template)
                    Image("HumbugerIcon1").renderingMode(.template)
                    Image("HumbugerIcon1").renderingMode(.template)
                }
                .frame(width: 50, height: 10)
                .bold()
                .foregroundColor(mustardYellow)
            }
            .padding(.leading, 5)
            .padding(.trailing, 5)
        }
    }
}

// Section 2: Banner (with Image and Text Overlay)
struct BannerSection: View {
    let mustardYellow = Color(red: 0.85, green: 0.56, blue: 0.0)
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("Main")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 240)
            
            Text("AWARD WINNING LUXURY\nCUSTOM HOME BUILDER")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .padding(6)
                .background(mustardYellow)
                .cornerRadius(6)
                .foregroundColor(.white)
                .padding(.bottom, 34)
                .padding(.leading, 10)
        }
        .padding(.top, -19)
    }
}

#Preview {
    HeaderView() // You can now use this in any view
}
