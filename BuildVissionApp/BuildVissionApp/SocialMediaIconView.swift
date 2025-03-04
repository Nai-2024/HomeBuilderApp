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
            Image("facebook").resizable().scaledToFit().frame(width: 40, height: 40)
            Image("instagram").resizable().scaledToFit().frame(width: 40, height: 40)
            Image("linkedin").resizable().scaledToFit().frame(width: 40, height: 40)
            Image("youtube").resizable().scaledToFit().frame(width: 40, height: 40)
        }
    }
}
