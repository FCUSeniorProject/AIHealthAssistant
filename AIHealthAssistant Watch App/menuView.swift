//
//  menuView.swift
//  Chatbot_App_demo WatchKit Extension
//
//  Created by Kuan-Lin Chiu on 2025/3/17.
//

import SwiftUI

struct menuView: View {
    @Binding var themeColor: Color // 綁定來更新主題顏色
    @State private var isUnlockGPT4Presented = false
    @State private var isThemePresented = false
    @State private var isAboutPresented = false
    @State private var isSpeechEnabled = false
    @State private var volume: Double = 0.5
    @State private var language: String = "English"
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    // Unlock GPT-4
                    HStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.white)
                            Text("Unlock GPT-4o")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("CustomColor"))
                                    .frame(height: 100))
                    .padding(.top, 20)
                    .onTapGesture {
                        isUnlockGPT4Presented.toggle()
                    }
                    .sheet(isPresented: $isUnlockGPT4Presented) {
                        UnlockGPTView(themeColor: $themeColor)
                    }
                    
                    // Theme
                    HStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "moon.fill")
                                .foregroundColor(.white)
                            Text("Theme")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("CustomColor"))
                                    .frame(height: 100))
                    .onTapGesture {
                        isThemePresented.toggle()
                    }
                    .sheet(isPresented: $isThemePresented) {
                        ThemeSelectionView(themeColor: $themeColor)
                    }

                    
                    // Enable Speech
                    HStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "ear.fill")
                                .foregroundColor(.white)
                            Text("Enable Speech")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Toggle("", isOn: $isSpeechEnabled)
                            .labelsHidden() // 隱藏標籤，只顯示開關
                            .foregroundColor(themeColor)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("CustomColor"))
                                    .frame(height: 100))
                    
                    // Volume
                    HStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "speaker.3.fill")
                                .foregroundColor(.white)
                            Text("Volume")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("CustomColor"))
                                    .frame(height: 100))
                    .onTapGesture {
                        // Handle volume change
                    }
                    
                    // Language
                    HStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "globe")
                                .foregroundColor(.white)
                            Text("Language")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("CustomColor"))
                                    .frame(height: 100))
                    .onTapGesture {
                        // Handle language change
                    }
                    
                    // About This App
                    HStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "info.circle")
                                .foregroundColor(.white)
                            Text("About This App")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("CustomColor"))
                                    .frame(height: 100))
                    .onTapGesture {
                        isAboutPresented.toggle()
                    }
                    .sheet(isPresented: $isAboutPresented) {
                        AboutView()
                    }
                }
            }
        }
        .background(Color.black)
        .foregroundColor(.white)
    }
    
    private func settingOption(title: String, description: String) -> some View {
        return VStack {
            Text(title)
                .font(.headline)
                .padding(.top, 10)
                .foregroundColor(themeColor)
            
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.2)))
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        @State var previewThemeColor: Color = .blue
        return menuView(themeColor: $previewThemeColor)
    }
}
