//
//  DeleteModelRequest.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

/// A structure that encapsulates the necessary data to request a model deletion in the Ollama API.
public struct DeleteModelRequest: Encodable {
    /// A string representing the identifier of the model to be deleted.
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}
