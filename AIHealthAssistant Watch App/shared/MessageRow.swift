import SwiftUI

struct MessageRow: Identifiable {
    let id = UUID()
    
    var isInterctingWithChatGPT: Bool
    
    let sendAvatar: String
    let sendText: String
    
    let responseAvatar: String
    var responseText: String?
    var responseError: String?
}
