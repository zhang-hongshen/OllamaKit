//
//  OllamaClient+Reachable.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation
import Combine

import Alamofire

extension OllamaClient {
    /// Asynchronously checks if the Ollama API is reachable.
    ///
    /// This method attempts to make a network request to the Ollama API. It returns `true` if the request is successful, indicating that the API is reachable. Otherwise, it returns `false`.
    ///
    /// ```swift
    /// let OllamaClient = OllamaClient(baseURL: URL(string: "http://localhost:11434")!)
    /// let isReachable = await OllamaClient.reachable()
    /// ```
    ///
    /// - Returns: `true` if the Ollama API is reachable, `false` otherwise.
    public func reachable() async -> Bool {

        let request = AF.request(router.root).validate()
        
        do {
            _ = try await request.serializingData().value
            
            return true
        } catch {
            return false
        }
    }
    
    /// Checks if the Ollama API is reachable, returning the result as a Combine publisher.
    ///
    /// This method performs a network request to the Ollama API and returns a Combine publisher that emits `true` if the API is reachable. In case of any errors, it emits `false`.
    ///
    /// ```swift
    /// let OllamaClient = OllamaClient(baseURL: URL(string: "http://localhost:11434")!)
    /// 
    /// OllamaClient.reachable()
    ///     .sink(receiveValue: { isReachable in
    ///         // Handle the reachability status
    ///     })
    ///     .store(in: &cancellables)
    /// ```
    ///
    /// - Returns: A `AnyPublisher<Bool, Never>` that emits `true` if the API is reachable, `false` otherwise.
    public func reachable() -> AnyPublisher<Bool, Never> {
        let request = AF.request(router.root).validate()
        
        return request.publishData().value()
            .map { _ in true }
            .replaceError(with: false)
            .eraseToAnyPublisher()
    }
}
