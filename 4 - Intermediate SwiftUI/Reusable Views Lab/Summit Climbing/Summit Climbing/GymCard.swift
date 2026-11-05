import SwiftUI

struct GymCard<Content: View>: View {
    var title: String
    var systemImage: String = "person.crop.circle"
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: systemImage)
                .font(.headline)
                .foregroundStyle(.orange)
            content()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.orange.opacity(0.12))
        .clipShape(.rect(cornerRadius: 12))
    }
}
