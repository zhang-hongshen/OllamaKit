//
//  CompletionResponse.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation

protocol CompletionResponse: Decodable {
    var model: String { get }
    var createdAt: Date { get }
    var done: Bool { get }
    
    var totalDuration: Int? { get }
    var loadDuration: Int? { get }
    var promptEvalCount: Int? { get }
    var promptEvalDuration: Int? { get }
    var evalCount: Int? { get }
    var evalDuration: Int? { get }
}
