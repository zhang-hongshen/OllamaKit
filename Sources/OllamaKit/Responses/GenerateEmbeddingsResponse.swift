//
//  GenerateEmbeddingsResponse.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

/// A structure that represents the response to an embedding request from the Ollama API.
public struct GenerateEmbeddingsResponse: Decodable {
    
    /// An array of floats representing the embeddings of the input prompt.
    public let embedding: [Float]?
}
