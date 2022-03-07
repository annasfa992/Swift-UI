//
//  BaseResultModel.swift
//  Classifieds iOS App (iOS)
//
//  Created by ANAS ELFAURI on 06/03/2022.
//

import Foundation
struct BaseResultModel <T: Codable>:  Codable {
    var results: T?
}
