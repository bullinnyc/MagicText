//
//  FantasyView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 24.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

struct FantasyView: View {
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
    
    // MARK: - Body
    
    var body: some View {
        let updatedSymbol = symbol == " " ? "  " : symbol
        
        Group {
            if isMask {
                let fontScale = fontSize * Double.random(in: 0.7 ... 0.9)
                let colors = DataManager.colors.map { Color($0) }
                
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

struct FantasyView_Previews: PreviewProvider {
    static var previews: some View {
        FantasyView(
            symbol: "K",
            textColor: Color(RM.yinYang),
            fontName: "Baskerville",
            fontSize: 28,
            isMask: true,
            delay: 0
        ) {}
    }
}
