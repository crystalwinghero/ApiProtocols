//
//  RequestBuilder.swift
//  
//
//  Created by Buzzwoo MBP on 5/4/21.
//

import Foundation

public struct RequestBuilder<T: APIRequestable, U : APIDataRepresentable> {
    var api : T
    var params : U?
    
    init(_ api : T, params : U?) {
        self.api = api
        self.params = params
    }
    
    func build() -> URLRequest {
        let url = api.url
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = api.headers
        request.httpMethod = String(describing: api.method.rawValue)
        request.httpBody = params?.toData()
        return request
    }
}
