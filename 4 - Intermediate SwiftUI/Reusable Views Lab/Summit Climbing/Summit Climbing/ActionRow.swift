import SwiftUI

struct ActionRow: View {
    var title: String
    var systemImage: String = "arrow.right.circle"
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: systemImage)
                    .foregroundStyle(.orange)
                    .frame(width: 28)

                Text(title)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 6)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
    }
}
