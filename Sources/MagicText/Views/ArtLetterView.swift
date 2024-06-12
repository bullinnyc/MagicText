//
//  ArtLetterView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 24.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

struct ArtLetterView: View {
    // MARK: - Property Wrappers
    
    @State private var opacity: Double = 0
    @State private var isAnimationCompleted = false
    
    // MARK: - Public Properties
    
    let symbol: String
    let textColor: Color
    let fontName: String
    let fontSize: CGFloat
    let delay: Double
    let completion: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        let updatedSymbol = symbol == " " ? "  " : symbol
        let colors = DataManager.colors.map { $0.color }
        
        let color = opacity == 1 && symbol != " "
            ? colors.randomElement() ?? .clear
            : .clear
        
        Text(updatedSymbol)
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(textColor)
            .opacity(opacity)
            .padding([.leading, .trailing], 1)
            .background(color.brightness(0.25))
            .onAnimationCompleted(value: opacity) {
                guard !isAnimationCompleted else { return }
                
                isAnimationCompleted.toggle()
                completion()
            }
            .onAppear {
                withAnimation(.easeInOut.delay(delay)) {
                    opacity = 1
                }
            }
    }
}

// MARK: - Preview Provider

struct ArtLetterView_Previews: PreviewProvider {
    static var previews: some View {
        ArtLetterView(
            symbol: "K",
            textColor: RM.yinYang.color,
            fontName: "Baskerville",
            fontSize: 28,
            delay: 0
        ) {}
    }
}
