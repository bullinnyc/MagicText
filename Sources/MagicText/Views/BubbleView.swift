//
//  BubbleView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 24.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

struct BubbleView: View {
    // MARK: - Property Wrappers
    
    @State private var blur: CGFloat = 10
    @State private var isAnimationCompleted = false
    
    // MARK: - Public Properties
    
    let symbol: String
    let textColor: Color
    let fontName: String
    let fontSize: CGFloat
    let isMask: Bool
    let delay: Double
    let completion: () -> Void
    
    // MARK: - Body Property
    
    var body: some View {
        let updatedSymbol = symbol == " " ? "  " : symbol
        
        Group {
            if isMask {
                let fontScale = fontSize * Double.random(in: 0.7 ... 0.9)
                let colors = DataManager.colorsName.map { Color($0) }
                
                let color = blur == .zero && symbol != " "
                ? colors.randomElement() ?? .clear
                : .clear
                
                Text(updatedSymbol)
                    .font(.custom(fontName, size: fontSize))
                    .foregroundColor(textColor)
                    .blur(radius: blur)
                    .opacity(blur == .zero ? 1 : 0)
                    .mask(
                        text: updatedSymbol,
                        fontName: fontName,
                        fontScale: fontScale
                    )
                    .background(
                        Circle()
                            .foregroundColor(color)
                            .brightness(0.55)
                    )
            } else {
                Text(updatedSymbol)
                    .font(.custom(fontName, size: fontSize))
                    .foregroundColor(textColor)
                    .blur(radius: blur)
                    .opacity(blur == .zero ? 1 : 0)
            }
        }
        .onAnimationCompleted(value: blur) {
            guard !isAnimationCompleted else { return }
            
            isAnimationCompleted.toggle()
            completion()
        }
        .onAppear {
            withAnimation(.easeInOut.delay(delay)) {
                blur = .zero
            }
        }
    }
}

// MARK: - Preview Provider

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(
            symbol: "K",
            textColor: .black,
            fontName: "Baskerville",
            fontSize: 28,
            isMask: true,
            delay: 0
        ) {}
    }
}
