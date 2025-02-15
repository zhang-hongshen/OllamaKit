//
//  ChatResponse.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

/// A structure that represents the response to a chat request from the Ollama API.
public struct ChatResponse: CompletionResponse, Decodable {
    /// A string representing the identifier of the model that processed the request.
    public let model: String
    
    /// A `Date` indicating when the response was created.
    public let createdAt: Date
    
    /// An optional `Message` instance representing the content of the response.
    public let message: Message?
    
    /// A boolean indicating whether the chat session is complete.
    public let done: Bool
    
    /// An optional integer representing the total duration of processing the request.
    public let totalDuration: Int?
    
    /// An optional integer indicating the duration of loading the model.
    public let loadDuration: Int?
    
    /// An optional integer specifying the number of evaluations performed on the prompt.
    public let promptEvalCount: Int?
    
    /// An optional integer indicating the duration of prompt evaluations.
    public let promptEvalDuration: Int?
    
    ///  An optional integer representing the total number of evaluations performed.
    public let evalCount: Int?
    
    ///  An optional integer indicating the duration of all evaluations.
    public let evalDuration: Int?
}
