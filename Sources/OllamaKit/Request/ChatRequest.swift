//
//  ChatRequest.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

/// A structure that encapsulates data for chat requests to the Ollama API.
public struct ChatRequest: Encodable {
    private let stream: Bool
    
    /// A string representing the model identifier to be used for the chat session.
    public let model: String
    
    /// An array of ``Message`` instances representing the content to be sent to the Ollama API.
    public let messages: [Message]
    
    /// Optional ``CompletionOptions`` providing additional configuration for the chat request.
    public var options: CompletionOptions?
    
    public init(model: String, messages: [Message]) {
        self.stream = true
        self.model = model
        self.messages = messages
    }
    
}
