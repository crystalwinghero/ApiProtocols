//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 5/4/21.
//

import Foundation

struct StagingHost : APIHost {
    var domain : String { "api.staging.myserver.com" }
    var prefix : String { "v2" }
}

struct ProductionHost : APIHost {
    var domain : String { "api.myserver.com" }
    var prefix : String { "v1" }
}

enum ServerEnv {
    case staging
    case production
    
    var host : APIHost {
        switch self {
        case .staging: return StagingHost()
        case .production: return ProductionHost()
        }
    }
}

struct APIConfig {
    static let env : ServerEnv = .staging
    
    static let clientID = "1"
    static let clientSecret = "YourClientSecretKey"
    
    static func clientToken() -> String {
        return "\(clientID):\(clientSecret)".data(using: .utf8)?.base64EncodedString() ?? ""
    }
    
    static func accessToken() -> String {
        return "UserAccessTokenHere"
    }
}
