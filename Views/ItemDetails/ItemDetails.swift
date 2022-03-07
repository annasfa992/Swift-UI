//
//  ItemDetails.swift
//  Classifieds iOS App (iOS)
//
//  Created by ANAS ELFAURI on 06/03/2022.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
struct ItemDetails : View {
    @State private var bookImage: UIImage? = nil
    private let displayData: ItemModel

    init(displayData: ItemModel) {
        self.displayData = displayData
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    
                    WebImage(url: URL(string: self.displayData.image_urls.first ?? ""))
                    // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                        .onSuccess { image, data, cacheType in
                            // Success
                            // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                        }
                        .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                        .placeholder(Image(systemName: "placeHolder")) // Placeholder Image
                    // Supports ViewBuilder as well
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5)) // Fade Transition with duration
                        .scaledToFit()
                        .frame(width: 300, height: 300, alignment: .center)
                    
                    Spacer()
                }
                
                Text(self.displayData.name)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                
                Spacer()
                Text("Price: \(self.displayData.price)")
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                
                Spacer()
            
                Text("created : \(self.displayData.created_at)")
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
            }
            
        }
        .navigationBarTitle(self.displayData.name)
    }
}


