//
//  HomeView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-07.
//

import SwiftUI

struct HomeView: View {
    
    var companyInfo: [String] = []
    var imageCollectio : [String] = []
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())] // Two equal-width columns
    
    var body: some View {
        ZStack {
            Color.gray
                .frame(height: 100)
            HStack {
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.leading, 10)  // Add some padding to the left side
                
                Spacer()
                
                Text("READY TO BUILD YOUR HOME")
                    .font(.footnote)
                    .bold()
                    .frame(width: 210, height: 50)
                    .minimumScaleFactor(0.5) // Ensures the text scales down to 50% of its original size if needed
                    .lineLimit(1) // Limit to one line of text
                    .scaledToFit() // Adjusts the text size dynamically to fit the frame
                    .background(Color(red: 0.85, green: 0.56, blue: 0.0)) // Dark mustard yellow
                    .cornerRadius(3)
                
                Spacer()
                
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 10)  // Add some padding to the right side
                
            }
        }
        
        
        ScrollView {
            
            Image("Cons-1")
                .resizable()
                .frame(width: .infinity, height: 300)
            
            Text("EXPLORE OUR CUSTOM HOME BUILT IN GTA")
                .foregroundColor(Color(red: 0.85, green: 0.56, blue: 0.0))
                .padding(.top, 10)
                .bold()
            
            Text("Explore the diverse tapestry of Apex Builders feature projects, showcasing extensive portfolio of custom homes across the GTA. Our wide-ranging expertise has allowed us to transform unique vision into stunn-ing realities from classic, timeless design to modern architectural masterpieces.")
                .padding(10)
        
            
            
            ZStack {
                // Yellow Background
                    Color(red: 0.85, green: 0.56, blue: 0.0) // Background Yellow Color
                        .edgesIgnoringSafeArea(.all) // Make it fill the entire screen
                        .frame(width: .infinity, height: 2030) // Full width, fixed height
                    
                    // VStack to stack multiple black boxes with text
                VStack(spacing: 20) { // Adjust spacing as needed
                    ForEach(0..<5, id: \.self) { _ in // Creates 5 black boxes
                        ZStack {
                            // Black Box
                            Color(.black)
                                .frame(width: 380, height: 400) // Fixed size for black box
                                .cornerRadius(7)
                            
                            // VStack to align the text vertically inside the black box
                            VStack {
                                // Text on top of the black box
                                Text("Custom Home Building")
                                    .font(.title2) // Font size
                                    .bold() // Make the text bold
                                    .foregroundColor(Color(red: 0.85, green: 0.56, blue: 0.0))
                                    .padding(10)
                                
                                // The longer description text placed below
                                Text("We take pride in crafting custom homes that perfectly reflect your unique vision and lifestyle. Our collaborative approach begins with understanding your needs and preferences, ensuring a seamless design process. With a commitment to quality, we use the finest materials and innovative techniques to bring your dream home to life. From the initial concept to the final walkthrough, our experienced team is dedicated to exceeding your expectations. Let us help you create a space where you and your family can thrive for years to come.")
                                    .foregroundColor(.white) // Text color (white on black box)
                                    .font(.body) // Font size for description
                                    .padding(.horizontal, 10) // Add horizontal padding
                                    .lineLimit(nil) // Allows the text to wrap across multiple lines
                                
                            }
                            .frame(maxHeight: .infinity) // Ensures the content takes up the entire space of the black box
                            .padding(.horizontal, 10) // Optional padding for the entire VStack
                        }
                    }
                }
            }
            
            
            // Yellow Background
            
            
            VStack {
        
                ZStack {
                            // Yellow Background
                            Color(red: 0.85, green: 0.56, blue: 0.0)
                                .edgesIgnoringSafeArea(.top) // Extend to top
                                .frame(height: 400) // Full width, fixed height
                    
                            VStack(alignment: .leading) {
                                Image(systemName: "star")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .padding(.top, 20)
                                    .padding(.leading, 10)  // Add some padding to the left side
                                Spacer()
                                
                                HStack {
                                    Text("QUICK LINKS")
                                        .padding(.leading, 10) // Move 10px from the left
                                    
                                    Spacer()
                                    Text("Address")
                                        .padding(.trailing, 80)
                                }
                                .foregroundColor(.black) // Set text color
                                .font(.title2) // Adjust font size
                                .fontWeight(.bold) // Make text bold
                                .padding(.bottom, 10)
                                .underline()
                                
                                VStack(alignment: .leading, spacing: 15) { // Align text to the left
                                    HStack {
                                        // Left side text items
                                        VStack(alignment: .leading, spacing: 10) {
                                            Text("> HOME")
                                            Text("> ABOUT US")
                                            Text("> PROJECTS")
                                            Text("> GALLERY")
                                            Text("> CONTACT US")
                                        }
                                        
                                        Spacer() // Pushes the next text to the right
                                        
                                        // Right side text item
                                        VStack(alignment: .leading, spacing: 15) {
                                            Text("123 Queen St.")
                                            Text("East Toronto, ON.")
                                            Text("A2B B2A")
                                                .multilineTextAlignment(.leading)
                                                
                                        }
                                        .offset(y: -25) // Move the address up by 25 points
                                        .padding(.trailing, 20)
                                    }
                                }
                              //  .font(.title) // Adjust font size
                                .foregroundColor(.black) // Set text color
                                .padding(.leading, 40) // Move text 40px from the left
                                .bold()

                           
                                VStack {
                                    Text("© APEX BUILDERS LUXURY HOME")
                                        .padding(.bottom, 5)

                                    Text("ALL RIGHTS RESERVED")
                                       
                                }
                                .foregroundColor(.black)
                                .font(.subheadline)
                                .padding(20) // Add padding to the bottom for spacing
                                .frame(maxWidth: .infinity) // This will center the text horizontally
                                .multilineTextAlignment(.center) // Ensure text is centered
                                .bold()
                            }
                        }
                    .padding(.top, 10) // Optional, for spacing between top content and bottom text
                }
            }
        }
    }


#Preview {
    HomeView()
}
