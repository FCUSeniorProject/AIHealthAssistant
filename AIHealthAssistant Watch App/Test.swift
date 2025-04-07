import SwiftUI

struct Test: View {
    @State var responseText = ""
    let api = ChatGPTAPI(apiKey: "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")
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .center, spacing: 50) {
                Button {
                    responseText = "Loading..."
                    Task {
                        do {
                            let stream = try await api.sendMessageStream(text: "什麼是ChatGPT")
                            responseText = ""
                            for try await line in stream {
                                responseText += line
                            }
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("提問(串流)")
                }
                .buttonStyle(.bordered)
                
                Button {
                    responseText = "Loading..."
                    Task {
                        do {
                            let text = try await api.sendMessage("什麼是ChatGPT")
                            responseText = text
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("提問(完整訊息)")
                }
                .buttonStyle(.bordered)
            }
            
            ScrollView {
                Text(responseText)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(Color.gray.opacity(0.5))
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
