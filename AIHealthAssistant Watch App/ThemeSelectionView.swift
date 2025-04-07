// ThemeSelectionView.swift
import SwiftUI

struct ThemeSelectionView: View {
    @Binding var themeColor: Color
    @AppStorage("CustomColor") private var CustomColor: String = "Dark Mode"
    @AppStorage("selectedIcon") private var selectedIcon: String = "tortoise.fill"

    let schemes = ["Dark", "Light", "Auto"]
    let schemeIcons = ["moon.fill", "sun.max.fill", "a.circle.fill"]
    let icons = ["tortoise.fill", "hare.fill", "dog.fill", "cat.fill", "bird.fill", "fish.fill", "pawprint.fill", "tree.fill", "mountain.2.fill", "sun.max.fill", "moon.fill"]
    let themeColors: [(name: String, color: Color)] = [
        ("Blue", .blue),
        ("Green", .green),
        ("Red", .red),
        ("Purple", .purple)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Scheme Picker
                settingRow(title: "Scheme") {
                    Picker(selection: $CustomColor, label: Text(CustomColor)) {
                        ForEach(Array(zip(schemes, schemeIcons)), id: \.0) { scheme, icon in
                            HStack {
                                Image(systemName: icon)
                                Text(scheme)
                            }.tag(scheme)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }

                // Icon Picker
                settingRow(title: "Icon") {
                    Picker(selection: $selectedIcon, label: Image(systemName: selectedIcon)) {
                        ForEach(icons, id: \.self) { icon in
                            Image(systemName: icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .tag(icon)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }

                // Theme Picker
                settingRow(title: "Theme") {
                    Picker(selection: $themeColor, label: HStack {
                        Circle()
                            .fill(themeColor)
                            .frame(width: 15, height: 15)
                    }) {
                        ForEach(themeColors, id: \.name) { theme in
                            HStack {
                                Circle()
                                    .fill(theme.color)
                                    .frame(width: 15, height: 15)
                                Text(theme.name)
                            }.tag(theme.color)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
            }
            .padding()
        }
        .background(Color.black)
        .foregroundColor(.white)
    }

    private func settingRow<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 80, alignment: .leading)
                .multilineTextAlignment(.leading)
            Spacer()
            content()
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color("CustomColor")))
    }
}

struct ThemeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        @State var previewThemeColor: Color = .blue
        return ThemeSelectionView(themeColor: $previewThemeColor)
    }
}
