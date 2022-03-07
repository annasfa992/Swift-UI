//
//  CardView.swift
//  Classifieds iOS App (iOS)
//
//  Created by ANAS ELFAURI on 06/03/2022.
//


import SwiftUI
import SDWebImageSwiftUI

// MARK: View CardView
struct CardView: View {
    
    var name: String
    var url: String
    
    
    var body: some View {
        
        HStack {
            AnimatedImage(url: URL(string: url)!)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(radius: 20)
            
            VStack(alignment: .leading) {
                Text(name).fontWeight(.heavy)
            }
        }
        
    }
}

