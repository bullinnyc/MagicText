//
//  CharmedView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 24.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

struct CharmedView: View {
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
    
    // MARK: - body Property
    var body: some View {
        Group {
            if isMask {
                let fontScale = fontSize * Double.random(in: 0.7 ... 0.9)
                
                Text(symbol)
                    .font(.custom(fontName, size: fontSize))
                    .foregroundColor(textColor)
                    .blur(radius: blur)
                    .opacity(blur == .zero ? 1 : 0)
                    .mask(
                        text: symbol,
                        fontName: fontName,
                        fontScale: fontScale
                    )
            } else {
                Text(symbol)
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
struct CharmedView_Previews: PreviewProvider {
    static var previews: some View {
        CharmedView(
            symbol: "K",
            textColor: .black,
            fontName: "Baskerville",
            fontSize: 30,
            isMask: true,
            delay: 0
        ) {}
    }
}
