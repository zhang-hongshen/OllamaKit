//
//  JSONEncoder+.swift
//  
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

internal extension JSONEncoder {
    static var `default`: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        return encoder
    }
}
