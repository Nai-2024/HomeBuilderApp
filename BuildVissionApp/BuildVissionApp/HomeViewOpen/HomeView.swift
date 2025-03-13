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
                .padding(.top, 10)
                .bold()
            
            Text("Explore the diverse tapestry of Apex Builders feature projects, showcasing extensive portfolio of custom homes across the GTA. Our wide-ranging expertise has allowed us to transform unique vision into stunn-ing realities from classic, timeless design to modern architectural masterpieces.")
                .padding(8) // Adds padding around the text for spacing
                    .frame(maxWidth: .infinity, alignment: .leading) // Ensures text uses all available space, aligned to the left
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
                            .frame(width: UIScreen.main.bounds.width, height: 300) // Fixed Frame
                            .clipped() // Ensures that image doesn't overflow
                            .padding(.bottom, 10) // Keeps it aligned correctly
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
                Color(red: 0.85, green: 0.56, blue: 0.0) // Background Yellow Color
                    .edgesIgnoringSafeArea(.all) // Make it fill the entire screen
                    .frame(width: .infinity, height: 1750) // Full width, fixed height
                
                // VStack to stack multiple black boxes with text
                VStack(spacing: 10) { // Adjust spacing as needed
                    ForEach(0..<blackBoxData.titles.count, id: \.self) { index in
                        ZStack {
                            // Black Box
                            Color(.black)
                                .frame(width: 380, height: 350) // Fixed size for black box
                                .cornerRadius(7)
                            
                            // VStack to align the text vertically inside the black box
                            VStack {
                                // Text on top of the black box
                                Text(blackBoxData.titles[index])
                                    .font(.title2) // Font size
                                    .bold() // Make the text bold
                                    .foregroundColor(Color(red: 0.85, green: 0.56, blue: 0.0))
                                    .padding(2)
                                
                                // The longer description text placed below
                                Text(blackBoxData.descriptions[index])
                                    .foregroundColor(Color(red: 176/255, green: 176/255, blue: 176/255))
                                    .font(.body) // Font size for description
                                    .padding(.horizontal, 10) // Add horizontal padding
                            }
                            .frame(maxHeight: .infinity) // Ensures the content takes up the entire space of the black box
                            .padding(.horizontal, 10) // Optional padding for the entire VStack
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


/*
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
                 .padding(.top, 10)
                 .bold()
             
             Text("Explore the diverse tapestry of Apex Builders feature projects, showcasing extensive portfolio of custom homes across the GTA. Our wide-ranging expertise has allowed us to transform unique vision into stunn-ing realities from classic, timeless design to modern architectural masterpieces.")
                 .padding(10)
             
             
             /* << =========== Header Section ============= >> */
             
             VStack {
                 // Scrollable Image Carousel with Rectangles Positioned 10px Below the Image
                 TabView(selection: $currentIndex) {
                     ForEach(0..<images.count, id: \.self) { index in
                         ZStack(alignment: .bottom) {
                             // Background Image
                             Image(images[index])
                                 .resizable()
                                 .scaledToFill()
                                 .frame(width: UIScreen.main.bounds.width, height: 300) //  Fixed Frame
                                 .clipShape(Rectangle()) //  Prevents extra spacing
                                .padding(.bottom, 10) // Keeps it aligned correctly
                             
                             // Rectangles Positioned 10px Below the Image
                            /* HStack(spacing: 10) {
                                 ForEach(0..<images.count, id: \.self) { rectIndex in
                                     Rectangle()
                                         .frame(width: 40, height: 10)
                                         .foregroundColor(currentIndex == rectIndex ? Color.orange : Color.gray.opacity(0.5)) // Highlight selected one
                                         .cornerRadius(5)
                                 }
                             }
                             .padding(.bottom, -5) //  Fix to place exactly 5px below the image
                             */
                         }
                         .tag(index) // Assign tag to track selected index
                     }
                 }
                 .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // No default page indicators
                 .frame(height: 280) // Ensures `TabView` doesn't shrink
             }
             
             
             // Text
             VStack {
                 Text("EXPLORE OUR SHOWCASE CUSTOM HOME")
                 Text("BUILT IN GTA")
             }
             .foregroundColor(Color(red: 0.85, green: 0.46, blue: 0.0))
             .bold()
             .padding(.top, 10)
             .frame(maxHeight: .infinity, alignment: .center)
             
             
             Text("Explore the diverse tapestry of Apex Builders feature projects, showcasing extensive portfolio of custom homes across the GTA. Our wide-ranging expertise has allowed us to transform unique vision into stunn-ing realities from classic, timeless design to modern architectural masterpieces.")
                 .padding(10)
             
             
             // Section 2 Main
             ZStack {
                 // Yellow Background
                 Color(red: 0.85, green: 0.56, blue: 0.0) // Background Yellow Color
                     .edgesIgnoringSafeArea(.all) // Make it fill the entire screen
                     .frame(width: .infinity, height: 1750) // Full width, fixed height
                 
                 // VStack to stack multiple black boxes with text
                 VStack(spacing: 10) { // Adjust spacing as needed
                     ForEach(0..<blackBoxData.titles.count, id: \.self) { index in
                         ZStack {
                             // Black Box
                             Color(.black)
                                 .frame(width: 380, height: 350) // Fixed size for black box
                                 .cornerRadius(7)
                             
                             // VStack to align the text vertically inside the black box
                             VStack {
                                 // Text on top of the black box
                                 Text(blackBoxData.titles[index])
                                     .font(.title2) // Font size
                                     .bold() // Make the text bold
                                     .foregroundColor(Color(red: 0.85, green: 0.56, blue: 0.0))
                                     .padding(2)
                                 
                                 // The longer description text placed below
                                 Text(blackBoxData.descriptions[index])
                                     .foregroundColor(Color(red: 176/255, green: 176/255, blue: 176/255))
                                     .font(.body) // Font size for description
                                     .padding(.horizontal, 10) // Add horizontal padding
                                 
                                 
                             }
                             .frame(maxHeight: .infinity) // Ensures the content takes up the entire space of the black box
                             .padding(.horizontal, 10) // Optional padding for the entire VStack
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

 */
