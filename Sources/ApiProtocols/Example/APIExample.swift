//
//  APIExample.swift
//  
//
//  Created by Buzzwoo MBP on 5/4/21.
//

import Foundation


///NOTE: There's already HTTPMethod struct, if you're using Alamofire.
enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case path = "PATCH"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
}

enum APIExample : APIRequestable {
    typealias Method = HTTPMethod
    
    case login
    case productList
    case productAdd
    case product(id : Int)
    case productEdit(id : Int)
    case productDelete(id : Int)
    
    var host: APIHost { APIConfig.env.host }
    
    var path: String {
        switch self {
        case .login:
            return "auth/token"
        case .productList, .productAdd:
            return "product"
        case .product(let id), .productEdit(let id), .productDelete(let id):
            return "product/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .productAdd:
            return .post
        case .productEdit(_):
            return .put
        case .productDelete(_):
            return .delete
        default:
            return .get
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .login:
            return ["Authorization": APIConfig.clientToken()]
        case .productAdd, .productEdit(_), .productDelete(_):
            return ["Authorization": APIConfig.accessToken()]
        default://public request, no header
            return [:]
        }
    }
    
    
}

typealias Dict = [String:Any]
typealias RB = RequestBuilder<APIExample, Dict>
func example() {
    let rb = RB(.productAdd, params: ["name": "foo", "price": 10])
    let request = rb.build()
    //TODO: call http request
    //Alamofire
//    AF.request(request).responseData { ... }
    //URLSession
//    let session = URLSession.shared
//    session.dataTask(with: request) { ... }
}
