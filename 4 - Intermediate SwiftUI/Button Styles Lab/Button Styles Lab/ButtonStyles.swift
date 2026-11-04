import SwiftUI

struct ChunkyButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(configuration.role == .destructive ? .red : color)
            .foregroundStyle(.white)
            .font(.body.bold())
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: configuration.isPressed ? 0 : 15)
            .offset(y: configuration.isPressed ? 4 : 0)
            
    }
}

struct CircleIconButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 44, height: 44)
            .background(.orange)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.85 : 1)
    }
}

struct ChipButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .clipShape(Capsule())
            .padding()
            .background(isSelected ? .orange : .gray.opacity(0.2))
            .foregroundStyle(isSelected ? .white : .primary)
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

extension ButtonStyle where Self == ChunkyButtonStyle {
    static func chunky(color: Color = .orange) -> ChunkyButtonStyle {
        ChunkyButtonStyle(color: color)
    }
}

extension ButtonStyle where Self == CircleIconButtonStyle {
    static func circleIcon() -> CircleIconButtonStyle {
        CircleIconButtonStyle()
    }
}

extension ButtonStyle where Self == ChipButtonStyle {
    static func chip(isSelected: Bool = true) -> ChipButtonStyle {
        ChipButtonStyle(isSelected: isSelected)
    }
}
