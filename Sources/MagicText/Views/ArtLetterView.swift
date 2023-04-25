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
    @State private var blur: CGFloat = 10
    @State private var isAnimationCompleted = false
    
    // MARK: - Public Properties
    let symbol: String
    let textColor: Color
    let fontName: String
    let fontSize: CGFloat
    let delay: Double
    let completion: () -> Void
    
    // MARK: - body Property
    var body: some View {
        let updatedSymbol = symbol == " " ? "  " : symbol
        let colors = DataManager.colorsName.map { Color($0) }
        
        let color = blur == .zero && symbol != " "
        ? colors.randomElement() ?? .clear
        : .clear
        
        Text(updatedSymbol)
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(textColor)
            .blur(radius: blur)
            .opacity(blur == .zero ? 1 : 0)
            .padding([.leading, .trailing], 1)
            .background(color.brightness(0.45))
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
struct ArtLetterView_Previews: PreviewProvider {
    static var previews: some View {
        ArtLetterView(
            symbol: "K",
            textColor: .black,
            fontName: "Baskerville",
            fontSize: 30,
            delay: 0
        ) {}
    }
}
