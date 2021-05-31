//
//  APIDataRepresentable.swift
//  
//
//  Created by Buzzwoo MBP on 26/4/21.
//

import Foundation

public protocol APIDataRepresentable {
    func toData() -> Data? 
}

extension Dictionary : APIDataRepresentable where Key == String {
    ///Convert to JSON Data
    public func toData() -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            return nil
        }
        return data
    }
    
}
