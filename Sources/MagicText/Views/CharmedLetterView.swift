//
//  CharmedLetterView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 24.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

struct CharmedLetterView: View {
    // MARK: - Property Wrappers
    @State private var blur: CGFloat = 10
    @State private var isAnimationCompleted = false
    
    // MARK: - Public Properties
    let symbol: String
    let textColor: Color
    let fontName: String
    let fontSize: CGFloat
    let backgroundColor: Color?
    let isMask: Bool
    let delay: Double
    let completion: () -> Void
    
    // MARK: - body Property
    var body: some View {
        let updatedSymbol = symbol == " " ? "  " : symbol
        
        Group {
            if isMask {
                let fontScale = fontSize * Double.random(in: 0.7 ... 0.9)
                
                let color = symbol != " "
                ? backgroundColor
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
                            .blur(radius: 6)
                            .brightness(0.45)
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
struct CharmedLetterView_Previews: PreviewProvider {
    static var previews: some View {
        CharmedLetterView(
            symbol: "K",
            textColor: .black,
            fontName: "Baskerville",
            fontSize: 30,
            backgroundColor: .red,
            isMask: true,
            delay: 0
        ) {}
    }
}
