//
//  UnlockGPTView.swift
//  Chatbot_App_demo WatchKit Extension
//
//  Created by Kuan-Lin Chiu on 2025/3/18.
//

import SwiftUI

struct UnlockGPTView: View {
    @Environment(\.presentationMode) var presentationMode // 讓畫面能返回
    @Binding var themeColor: Color // 綁定來更新主題顏色

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Get the latest AI model")
                        .font(.bold(.title3)())
                        .foregroundColor(.white)
                }
                
                HStack(alignment: .center){
                    Text("GPT-4 is the latest AI model that provides advanced capabilities and improved performance. By unlocking GPT-4, you can access cutting-edge features and enhancements that will elevate your experience.")
                        .font(.bold(.caption2)())
                        .foregroundColor(.gray)
                }

                HStack(alignment: .center){
                    Text("Or keep using the old version of GPT-3.5 model, which also provides great performance.")
                        .font(.bold(.caption2)())
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Purchase GPT-4")
                            .font(.headline)
                    }
                    .foregroundColor(themeColor)
                    .frame(maxWidth: .infinity)

                }
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Restore Purchase")
                            .font(.headline)
                    }
                    .foregroundColor(themeColor)
                    .frame(maxWidth: .infinity)

                }
            }
            .padding()
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct UnlockGPTView_Previews: PreviewProvider {
    static var previews: some View {
        @State var previewThemeColor: Color = .blue
        return UnlockGPTView(themeColor: $previewThemeColor)
    }
}
