import SwiftUI

struct ChatView: View {
    @StateObject var modelData = ViewModel(api: ChatGPTAPI(apiKey: "Your_API_Key"))

    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
            ChatListView(modelData: modelData)
                .navigationBarHidden(true)
            VStack {
                HStack(spacing: 20) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 24, height: 24)
                        }
                        .disabled(modelData.isInteractingWithChatGPT)
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            modelData.clearMessages()
                        }){
                            Image(systemName: "trash")
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 20, height: 24)
                        }
                        .disabled(modelData.isInteractingWithChatGPT)
                        .buttonStyle(PlainButtonStyle())
                        
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                Spacer()
            }
            .background(Color.clear)
            .ignoresSafeArea()
        }
        
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
