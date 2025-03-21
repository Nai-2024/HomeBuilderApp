//
//  SocialMediaIconView.swift
//  BuildVissionApp
//
//  Created by Din Salehy on 2025-03-01.
//

import Foundation

import SwiftUI

struct SocialMediaIconsView: View {
    var body: some View {
        HStack(spacing: 4) {
            
            Button(action: { openURL("https://www.facebook.com/") }) {
                Image("facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            Button(action: { openURL("https://www.instagram.com/") }) {
                Image("instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Button(action: { openURL("https://www.linkedin.com/") }) {
                Image("linkedin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
            Button(action: { openURL("https://www.youtube.com/") }) {
                Image("youtube")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            
        }
    }
    // This funciton opens a given URL in web browser.
    func openURL(_ urlString: String) { // takes parameter of type string
        // Attempts to create a URL object from the provided urlString.If urlString is a valid URL, url is assigned a URL object.If urlString is invalid (e.g., a malformed URL like "invalid_url"), this block is skipped.
        if let url = URL(string: urlString) {
            
            //Calls UIApplication.shared.open(url), which opens the URL using the appropriate app.
            UIApplication.shared.open(url)
        }
    }
}
