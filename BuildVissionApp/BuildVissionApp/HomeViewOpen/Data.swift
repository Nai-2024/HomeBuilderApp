//
//  Data.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-02-27.
//

import SwiftUICore

class BlackBoxData {
    static let shared = BlackBoxData() // Singleton for easy access

    let cityNames = ["Toronto", "Vaughan", "Markham", "Oakville", "Oshawa", "North York"]

    let titles = [
        "CUSTOM HOME BUILDING",
        "HOME RENOVATION",
        "CONSTRUCTION MANAGEMENT",
        "INTERIOR DESIGN CONSULTANT",
        "REAL ESTATE SERVICES"
    ]

    let descriptions = [
        "We take pride in crafting custom homes that perfectly reflect your unique vision and lifestyle. Our collaborative approach begins with understanding your needs and preferences, ensuring a seamless design process. With a commitment to quality, we use the finest materials and innovative techniques to bring your dream home to life. From the initial concept to the final walkthrough, our experienced team is dedicated to exceeding your expectations. Let us help you create a space where you and your family can thrive for years to come.",
        "We specialize in transforming your existing space into a stunning new environment through our home renovation services. Whether you’re looking to update your kitchen, remodel your bathroom, or add extra living space, our expert team is here to guide you every step of the way. We prioritize your vision, ensuring that every renovation reflects your personal style and enhances your home’s functionality. With a focus on quality craftsmanship and attention to detail, we strive to create beautiful, lasting results. Our commitment to excellence ensures your satisfaction throughout the entire process.",
        "Our construction management services ensure that your project runs smoothly from start to finish. Our experienced team coordinates all aspects of the construction process, including budgeting, scheduling, and quality control. We prioritize clear communication with all stakeholders, keeping you informed and involved every step of the way. With a strong focus on efficiency, quality, and safety, trust us to deliver your project on time and within budget, while maintaining the highest standards of craftsmanship. Excellence is our top priority.",
        "Our interior design consulting services are tailored to create spaces that reflect your personal style and meet your functional needs. Our skilled designers work closely with you to understand your vision and preferences, offering expert advice on color schemes, furnishings, and layouts. We emphasize creativity and innovation, blending aesthetics with practicality to enhance your living or working environment. From concept development to final implementation, we ensure that every detail is thoughtfully considered.",
        "Our real estate services are designed to help you navigate the complex property market with ease. Whether you’re buying, selling, or managing properties, our experienced team provides expert guidance tailored to your needs. We offer comprehensive market analysis and property evaluations to ensure you make informed decisions. With a focus on personalized service, we strive to build lasting relationships with our clients. Trust Apex Builders to be your reliable partner in achieving success in all your real estate ventures. We are dedicated to your success and satisfaction."
    ]

    let cityImages: [String: [String]] = [
        "Toronto": ["Toronto1","Toronto2", "Toronto3", "Toronto4", "Toronto5", "Toronto6", "Toronto7"],
        "Oakville": ["OA1", "OA2", "OA3", "OA4", "OA5", "OA6", "OA7"],
        "Oshawa": ["Oshawa1","Oshawa2", "Oshawa3", "Oshawa4", "Oshawa5", "Oshawa6", "Oshawa7"],
        "Markham": ["Markham1","Markham2", "Markham3", "Markham4", "Markham5", "Markham6", "Markham7"],
        "North York": ["NY1", "NY2", "NY3", "NY4", "NY5", "NY6", "NY7"],
        "Vaughan": ["Vaughan1","Vaughan2", "Vaughan3", "Vaughan4", "Vaughan5", "Vaughan6", "Vaughan7"]
    ]

    // Function to get the first image for a city
    func getFirstImage(for city: String) -> String {
        // Check if the city exists in the cityImages dictionary, and return the first image or a placeholder
        if let images = cityImages[city], !images.isEmpty {
            return images[0]
        } else {
            return "PlaceholderImage" // Default placeholder if no images exist for the city
        }
    }
    
    // Function to return the correct view based on city name
    @ViewBuilder
    func getDestinationView(for city: String) -> some View {
        switch city {
        case "Toronto":
            TorontoView()
        case "Markham":
            MarkhamView()
        case "Oakville":
            OakvilleView()
        case "Oshawa":
            OshawaView()
        case "North York":
            NorthYorkView()
        case "Vaughan":
            VaughanView()
        default:
            Text("View not found")
        }
    }

}
