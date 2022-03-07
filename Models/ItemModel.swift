//
//  ItemModel.swift
//  Classifieds iOS App (iOS)
//
//  Created by ANAS ELFAURI on 06/03/2022.
//

import Foundation
import SwiftUI
struct ItemModel :  Codable , Identifiable{
    let id = UUID()
    var name: String
    var image_urls: [String]
    var price: String
    var created_at : String
    
}
