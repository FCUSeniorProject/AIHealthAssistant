import SwiftUI

struct AboutView: View {

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("About This App")
                        .font(.bold(.title3)())
                        .foregroundColor(.white)
                }

                Text("This application is designed to collect physiological data from users and analyze it in combination with other device data for location tracking, health monitoring, and data-driven insights. The primary goal is to enhance personal health awareness and provide valuable recommendations for a better lifestyle.")
                    .foregroundColor(.gray)
                    .font(.bold(.caption2)())
            }
            .padding()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
