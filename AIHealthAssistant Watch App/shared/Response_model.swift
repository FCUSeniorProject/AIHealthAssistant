//
//  Response_model.swift
//  Chatbot_App_demo WatchKit App
//
//  Created by Kuan-Lin Chiu on 2025/4/5.
//

import Foundation

// MARK: - Resposne
struct CompletionResponse: Decodable {
    let choices: [Choice]
}

struct Choice: Decodable {
    let message: Message
}

struct StreamCompletionResponse: Decodable {
    let choices: [StreamChoice]
}

struct StreamChoice: Decodable {
    let delta: StreamMessage
}

struct StreamMessage: Decodable {
    let role: String?
    let content: String?
}

// MARK: - Error
struct ErrorRootResponse: Decodable {
    let error: ErrorResponse
}
struct ErrorResponse: Decodable {
    let message: String
    let type: String?
}
