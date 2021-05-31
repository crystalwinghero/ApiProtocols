//
//  APIRequestable.swift
//  
//
//  Created by Buzzwoo MBP on 5/4/21.
//

import Foundation

public protocol APIRequestable {
    associatedtype Method : RawRepresentable
    
    var host : APIHost { get }
    
    var path : String { get }
    var url : URL { get }
    var method : Method { get }
    var headers : [String:String] { get }
}

public extension APIRequestable {
    var url : URL { URL(string: host.apiPath + path)! }
}
