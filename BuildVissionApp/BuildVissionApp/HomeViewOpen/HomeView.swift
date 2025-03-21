//
//  HomeView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-07.
//
import SwiftUI

struct HomeView: View {
    
    @State private var selectedButton: String? = nil
    @State private var showImage = false  // State variable to toggle image visibility
    @State private var currentIndex = 0 // Track selected image index
    var companyInfo: [String] = []
    var imageCollectio : [String] = []
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())] // Two equal-width columns
    
    let blackBoxData = BlackBoxData()
    
    // Array of image names (ensure these match exactly with the names in Assets)
    let images = ["Image1", "Image2", "Image3", "Image4", "Image5", "Image6"]
    
    var body: some View {
        
        /* << =========== Header-Nav Section ============= >> */
        
        HeaderSection()
            .padding(.bottom, -8)
        
        /* << =========== Header Section ============= >> */
        
        ScrollView {
            BannerSection()
            
            Text("EXPLORE OUR CUSTOM HOME BUILT IN GTA")
                .foregroundColor(Color(red: 0.85, green: 0.46, blue: 0.0))
                .padding(.top, 12)
                .padding(.bottom, -13)
                .bold()
            
            Text("Explore the diverse tapestry of Apex Builders feature projects, showcasing extensive portfolio of custom homes across the GTA. Our wide-ranging expertise has allowed us to transform unique vision into stunn-ing realities from classic, timeless design to modern architectural masterpieces.")
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(nil) // Ensures that the text can wrap across multiple lines
                .multilineTextAlignment(.leading) // Aligns the text to the left, without gaps
            
               
            
            
            /* << =========== Body Section ============= >> */
            
            ZStack {
                // Scrollable Image Carousel (Horizontal ScrollView)
                TabView {
                    ForEach(images, id: \.self) { image in
                        // Background Image
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                            .clipped() // Ensures that image doesn't overflow
                            .padding(.bottom, 10)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // Shows page dots
                .frame(height: 300) // Keeps TabView frame height consistent
            }
            .padding(.top, 10)
            .padding(.bottom, 5)
            
            // Text
            VStack {
                Text("EXPLORE OUR SHOWCASE CUSTOM HOME")
                Text("BUILT IN GTA")
            }
            .foregroundColor(Color(red: 0.85, green: 0.46, blue: 0.0))
            .bold()
            //.padding(.top, 10)
            .frame(maxHeight: .infinity, alignment: .center)
            
            Text("Explore our comprehensive suite of services, meticul- ously tailored to guide you through every step of your custom home building journey. From Initial design  concepts to construction and final finishing touches.  We provide you with expertise and support needed to make your dream home a reality.")
               .padding(.bottom, 12)
            
            // Section 2 Main
            ZStack {
                // Yellow Background
                Color(red: 0.85, green: 0.56, blue: 0.0)
                    .edgesIgnoringSafeArea(.all) // Make it fill the entire screen
                    .frame(width: .infinity, height: 1750) // Full width, fixed height
                
              
                VStack(spacing: 10) { // Adjust spacing as needed
                    ForEach(0..<blackBoxData.titles.count, id: \.self) { index in
                        ZStack {
                            // Black Box
                            Color(.black)
                                .frame(width: 380, height: 350) // Fixed size for black box
                                .cornerRadius(7)
                            
                            VStack(alignment: .center, spacing: 10) {
                                // Title
                                Text(blackBoxData.titles[index])
                                    .font(.title2) // Font size
                                    .bold() // Make the text bold
                                    .foregroundColor(Color(red: 0.85, green: 0.56, blue: 0.0))
                                   
                                   .padding(.top, 20)
                                
                                // Description
                                Text(blackBoxData.descriptions[index])
                                    .foregroundColor(Color(red: 176/255, green: 176/255, blue: 176/255))
                                    .font(.body)
                                    .padding(.horizontal, 10)
                                    .padding(.top, -10)
                            }
                            .frame(maxHeight: .infinity, alignment: .top)
                            .padding(.horizontal, 10)
                        }
                    }
                }
            }
            
            // Yellow Background -- Footer
            FooterView()
                .padding(.top, 5)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}

