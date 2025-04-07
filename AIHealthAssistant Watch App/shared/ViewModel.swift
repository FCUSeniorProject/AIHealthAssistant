import Foundation
import SwiftUI
import AVKit

final class ViewModel: ObservableObject {
    @Published var messages: [MessageRow] = []
    @Published var inputMessage: String = ""
    @Published var isInteractingWithChatGPT = false
    let userAvatar = "profile"
    let botAvatar = "openai"
    
    private let api: ChatGPTAPI
        init(api: ChatGPTAPI) {
            self.api = api
        }
        
        @MainActor
        /// 發送訊息
        func sendTapped() async {
            let text = inputMessage
            inputMessage = ""
            await send(text: text)
        }
        
        @MainActor
        /// 再試一次
        func retry(message: MessageRow) async {
            guard let index = messages.firstIndex(where: { $0.id == message.id }) else { return }
            self.messages.remove(at: index)
            await send(text: message.sendText)
        }
        
        @MainActor
        /// 清除訊息
        func clearMessages() {
            api.deleteHistoryList()
            withAnimation {
                messages.removeAll()
            }
        }
        
        @MainActor
        private func send(text: String) async {
            isInteractingWithChatGPT = true
            var streamText = ""
            var messageRow = MessageRow(
                isInterctingWithChatGPT: true,
                sendAvatar: userAvatar,
                sendText: text,
                responseAvatar: botAvatar,
                responseText: streamText,
                responseError: nil
            )
            self.messages.append(messageRow)
            
            do {
                let stream = try await api.sendMessageStream(text: text)
                for try await text in stream {
                    streamText += text
                    messageRow.responseText = streamText.trimmingCharacters(in: .whitespacesAndNewlines)
                    self.messages[self.messages.count - 1] = messageRow
                }
            } catch {
                messageRow.responseError = error.localizedDescription
            }
            
            messageRow.isInterctingWithChatGPT = false
            self.messages[self.messages.count - 1] = messageRow
            isInteractingWithChatGPT = false
        }
}
