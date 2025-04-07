import SwiftUI
import WatchKit

struct ContentView: View {
    @State private var isListening = false
    @State private var messages: [String] = []
    @State private var isMenuPresented = false
    @State private var themeColor: Color = .blue
    @AppStorage("selectedIcon") private var selectedIcon: String = "tortoise.fill"

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)

                VStack(alignment: .center) {
                    Spacer()
                    
                    Button(action: {
                        isMenuPresented = true
                    }) {
                        Image(systemName: selectedIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 60)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $isMenuPresented) {
                        menuView(themeColor: $themeColor)
                    }.buttonStyle(PlainButtonStyle())
                    
                    Spacer()

                    NavigationLink(destination: ChatView()) {
                        Text("Ask me any health questions")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            .padding(.horizontal, 20)
                    }.buttonStyle(PlainButtonStyle())

                    Spacer()
                }

            }
        }
    }
}

struct watchApp_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
