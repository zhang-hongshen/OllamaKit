//
//  ModelInfoRequest.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

/// A structure that encapsulates the data necessary for requesting information about a specific model from the Ollama API.
public struct ModelInfoRequest: Encodable {
    /// A string representing the identifier of the model for which information is requested.
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}
