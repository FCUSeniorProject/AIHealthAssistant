import SwiftUI

struct ChatListView: View {
    @ObservedObject var modelData: ViewModel
    @State private var isTextFieldFocused: Bool = false

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(modelData.messages) { message in
                            MessageRowView(message: message) { message in
                                // 再試一次
                                Task { @MainActor in
                                    await modelData.retry(message: message)
                                }
                            }
                        }
                    }
                    .onChange(of: modelData.messages.last?.responseText) { _ in
                        scrollToBottom(proxy: proxy)
                    }
                }

                Divider()

                inputView(proxy: proxy)
            }
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
        .ignoresSafeArea(edges: .bottom)
    }

    func inputView(proxy: ScrollViewProxy) -> some View {
        HStack(alignment: .center) {
            AvatarImage(
                image: modelData.userAvatar,
                size: CGSize(width: 40, height: 40)
            )

            TextField("請輸入訊息...", text: $modelData.inputMessage)
                .font(.headline)
                .disabled(modelData.isInteractingWithChatGPT)
                .onTapGesture {
                    self.presentInputController(withSuggestions: []) { result in
                        Task { @MainActor in
                            guard !result.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                            modelData.inputMessage = result.trimmingCharacters(in: .whitespacesAndNewlines)
                            await modelData.sendTapped()
                        }
                    }
                }
        }
        .padding(.horizontal, 10)
        .padding(.top, 5)
        .padding(.bottom, 10)
    }

    private func scrollToBottom(proxy: ScrollViewProxy) {
        guard let id = modelData.messages.last?.id else { return }
        proxy.scrollTo(id, anchor: .bottomTrailing)
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView(modelData: ViewModel(api: ChatGPTAPI(apiKey: "your-api-key")))
    }
}

extension ChatListView {
    typealias StringCompletion = (String) -> Void
    
    func presentInputController(withSuggestions suggestions: [String], completion: @escaping StringCompletion) {
        WKExtension.shared()
            .visibleInterfaceController?
            .presentTextInputController(withSuggestions: suggestions,
                                        allowedInputMode: .plain) { result in
                
                guard let result = result as? [String], let firstElement = result.first else {
                    completion("")
                    return
                }
                
                completion(firstElement)
            }
    }
}
