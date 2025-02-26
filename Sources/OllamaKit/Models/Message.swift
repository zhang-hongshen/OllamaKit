//
//  Message.swift
//  ModelCraft
//
//  Created by 张鸿燊 on 29/3/2024.
//

import Foundation

/// A structure that represents a single message in the chat request.
public struct Message: Codable {
    /// A ``Role`` value indicating the sender of the message (system, assistant, user, tool).
    public let role: Role
    
    /// A string containing the message's content.
    public let content: String
    
    /// An optional array of base64-encoded images.
    public let images: [String]?
    
    /// An optional array of tools in JSON that the model wants to use
    public let toolCalls: [String]?
    
    public init(role: Role, content: String,
                images: [String] = [], toolCalls: [String] = []) {
        self.role = role
        self.content = content
        self.images = images
        self.toolCalls = toolCalls
    }
    
    /// An enumeration that represents the role of the message sender.
    public enum Role: String, Codable {
        /// Indicates the message is from the system.
        case system
        
        /// Indicates the message is from the assistant.
        case assistant
        
        /// Indicates the message is from the user.
        case user
        
        /// Indicates the message is about tool.
        case tool
    }
}
