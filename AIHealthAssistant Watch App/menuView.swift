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
    @AppStorage("isSpeechEnabled") private var isSpeechEnabled = false
    @State private var volume: Double = 0.5
    @State private var language: String = "English"
    @State private var wiggleTrigger = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    // Unlock GPT-4
                    HStack() {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "lock.fill")
                                .foregroundColor(themeColor)
                            Text(LocalizedStringKey("Unlock GPT"))
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .frame(maxWidth:.infinity)
                    .padding(10)
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
                    HStack() {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "moon.fill")
                                .foregroundColor(themeColor)
                            Text(LocalizedStringKey("Theme"))
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .frame(maxWidth:.infinity)
                    .padding(10)
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
                            Image(systemName: "waveform")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(themeColor)
                                .symbolEffect(.wiggle, value: wiggleTrigger)
                            Text(LocalizedStringKey("Speech"))
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Toggle("", isOn: $isSpeechEnabled)
                            .labelsHidden()
                            .foregroundColor(themeColor)
                            .onChange(of:isSpeechEnabled){
                                wiggleTrigger.toggle()
                            }
                    }
                    .frame(maxWidth:.infinity)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color("CustomColor"))
                        .frame(height:100)
                    )
                    // Volume
                    HStack() {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "speaker.3.fill")
                                .foregroundColor(themeColor)
                            Text(LocalizedStringKey("Vol"))
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("CustomColor"))
                                    .frame(height: 100))
                    .onTapGesture {
                        // Handle volume change
                    }
                    
                    // About This App
                    HStack() {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: "info.circle")
                                .foregroundColor(themeColor)
                            Text(LocalizedStringKey("About"))
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding(10)
                    .frame(maxWidth:.infinity)
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
