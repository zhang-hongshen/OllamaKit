//
//  GenerateEmbeddingsRequest.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

/// A structure that encapsulates the data required for generating embeddings using the Ollama API.
public struct GenerateEmbeddingsRequest: Encodable {
    /// A string representing the identifier of the model.
    public let model: String
    
    /// A string containing the initial input or prompt.
    public let prompt: String
    
    /// Optional ``CompletionOptions`` providing additional configuration for the generation request.
    public var options: CompletionOptions?
    
    /// Optionally control how long the model will stay loaded into memory following the request (default: 5m)
    public var keep_alive: String?
    
    public init(model: String, prompt: String) {
        self.model = model
        self.prompt = prompt
    }
}
