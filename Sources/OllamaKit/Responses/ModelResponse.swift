//
//  ModelResponse.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

/// A structure that represents the available models from the Ollama API.
public struct ModelResponse: Decodable {
    /// An array of ``Model`` instances, each representing a specific model available in the Ollama API.
    public let models: [ModelInfo]
    
}
