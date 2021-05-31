//
//  File.swift
//  
//
//  Created by Buzzwoo MBP on 5/4/21.
//

import Foundation

public protocol APIHost {
    var scheme : String { get }
    var domain : String { get }
    var prefix : String { get }
    
    var apiPath : String { get }
}
public extension APIHost {
    var scheme : String { "https" }
    var apiPath : String { "\(scheme)://\(domain)/\(prefix)/" }
}
