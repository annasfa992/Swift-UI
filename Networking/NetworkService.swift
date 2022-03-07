//
//  NetworkService.swift
//  Classifieds iOS App (iOS)
//
//  Created by ANAS ELFAURI on 06/03/2022.
//

import Foundation


// MARK: services
enum services :String{
    case dynamodbWriter = "default/dynamodb-writer"
    
}

// MARK: baseURL
var baseURL: String {
    switch NetworkManager.networkEnviroment {
    case .dev: return "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
    case .production: return "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
    case .stage: return "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
    }
}

class NetworkService : NSObject{
    
}
