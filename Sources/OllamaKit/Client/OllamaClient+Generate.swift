//
//  OllamaClient+Generate.swift
//
//
//  Created by 张鸿燊 on 22/3/2024.
//

import Foundation
import Combine

import Alamofire

extension OllamaClient {
    /// Establishes a Combine publisher for streaming responses from the Ollama API, based on the provided data.
    ///
    /// This method sets up a streaming connection using the Combine framework, allowing for real-time data handling as the responses are generated by the Ollama API.
    ///
    /// ```swift
    /// let OllamaClient = OllamaClient(baseURL: URL(string: "http://localhost:11434")!)
    /// let requestData = GenerateRequest(/* parameters */)
    ///
    /// OllamaClient.generate(data: requestData)
    ///     .sink(receiveCompletion: { completion in
    ///         // Handle completion or error
    ///     }, receiveValue: { generateResponse in
    ///         // Handle each generated response
    ///     })
    ///     .store(in: &cancellables)
    /// ```
    ///
    /// - Parameter data: The ``GenerateRequest`` used to initiate the streaming from the Ollama API.
    /// - Returns: An `AnyPublisher<GenerateResponse, AFError>` emitting the live stream of responses from the Ollama API.
    public func generate(data: GenerateRequest) -> AnyPublisher<GenerateResponse, AFError> {
        let subject = PassthroughSubject<GenerateResponse, AFError>()
        let request = AF.streamRequest(router.generate(data: data)).validate()
        
        request.responseStreamDecodable(of: GenerateResponse.self, using: decoder) { stream in
            switch stream.event {
            case .stream(let result):
                switch result {
                case .success(let response):
                    subject.send(response)
                case .failure(let error):
                    subject.send(completion: .failure(error))
                }
            case .complete(let completion):
                if let error = completion.error {
                    subject.send(completion: .failure(error))
                } else {
                    subject.send(completion: .finished)
                }
            }
        }
        
        return subject.eraseToAnyPublisher()
    }
}
