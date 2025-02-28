//
//  GenerateRequest.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

/// A structure that encapsulates the data required for generating responses using the Ollama API.
public struct GenerateRequest: Encodable {
    public var stream: Bool
    
    /// A string representing the identifier of the model.
    public let model: String
    
    /// A string containing the initial input or prompt.
    public let prompt: String
    
    /// /// An optional array of base64-encoded images.
    public let images: [String]
    
    /// An optional string specifying the system message.
    public var system: String?
    
    /// An optional array of integers representing contextual information.
    public var context: [Int]?
    
    /// Optional ``CompletionOptions`` providing additional configuration for the generation request.
    public var options: CompletionOptions?
    
    public init(stream: Bool = true, model: String,
                prompt: String, images: [String] = [],
                options: CompletionOptions? = nil) {
        self.stream = stream
        self.model = model
        self.prompt = prompt
        self.images = images
        self.options = options
    }
}
