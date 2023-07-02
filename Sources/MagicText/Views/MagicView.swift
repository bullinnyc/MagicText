//
//  MagicView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 20.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

/// Show a magic view.
public struct MagicView: View {
    // MARK: - Property Wrappers
    
    @State private var animationCounter = 0
    
    // MARK: - Private Properties
    
    private let text: String
    private let textColors: [Color]
    private let textAlignment: HorizontalAlignment
    private let fontName: String
    private let fontSize: CGFloat
    private let minCharactersPerLine: Int
    private let magicType: MagicType
    private let delayStart: Double
    private let completion: (() -> Void)?
    
    // MARK: - Public Enums
    
    public enum MagicType {
        case charmed
        case artLetter
        case bubble
        case fantasy
        case charmedLetter(backgroundColor: Color = .red)
    }
    
    // MARK: - Body Property
    
    public var body: some View {
        VStack(alignment: textAlignment) {
            let texts = createTexts(
                text: text,
                minCharactersPerLine: minCharactersPerLine
            )
            
            let textCount = texts.joined().count
            
            ForEach(texts, id: \.self) { element in
                HStack(spacing: 0.5) {
                    ForEach(0 ..< element.count, id: \.self) { index in
                        let perLineDelay = delayStart +
                            Double.random(in: 0.1 ... 1.8)
                        
                        let firstDelay = perLineDelay + Double(index) * 0.5 *
                            Double.random(in: 0.004 ... 0.5)
                        
                        let secondDelay = perLineDelay + Double(index) *
                            Double.random(in: 0.1 ... 0.3)
                        
                        let symbol = String(Array(element)[index])
                        let textColor = textColors.randomElement() ?? .black
                        
                        ZStack {
                            switch magicType {
                            case .charmed:
                                CharmedView(
                                    symbol: symbol,
                                    textColor: textColor,
                                    fontName: fontName,
                                    fontSize: fontSize,
                                    isMask: true,
                                    delay: firstDelay
                                ) {
                                    checkLastAnimation(textCount)
                                }
                                
                                CharmedView(
                                    symbol: symbol,
                                    textColor: textColor,
                                    fontName: fontName,
                                    fontSize: fontSize,
                                    isMask: false,
                                    delay: secondDelay
                                ) {
                                    checkLastAnimation(textCount)
                                }
                            case .artLetter:
                                let scale = CGFloat.random(in: 0.5 ... 1.1)
                                let degrees = Double.random(in: -10 ... 10)
                                let offset = CGFloat.random(in: -4 ... 4)
                                
                                ArtLetterView(
                                    symbol: symbol,
                                    textColor: textColor,
                                    fontName: fontName,
                                    fontSize: fontSize,
                                    delay: firstDelay
                                ) {
                                    checkLastAnimation(textCount)
                                }
                                .scaleEffect(scale)
                                .rotationEffect(.degrees(degrees))
                                .offset(y: offset)
                            case .bubble:
                                let scale = Double.random(in: 0.5 ... 1.1)
                                let offset = CGFloat.random(in: -2 ... 2)
                                
                                Group {
                                    BubbleView(
                                        symbol: symbol,
                                        textColor: textColor,
                                        fontName: fontName,
                                        fontSize: fontSize,
                                        isMask: true,
                                        delay: firstDelay
                                    ) {
                                        checkLastAnimation(textCount)
                                    }
                                    
                                    BubbleView(
                                        symbol: symbol,
                                        textColor: textColor,
                                        fontName: fontName,
                                        fontSize: fontSize,
                                        isMask: false,
                                        delay: secondDelay
                                    ) {
                                        checkLastAnimation(textCount)
                                    }
                                }
                                .scaleEffect(scale)
                                .offset(y: offset)
                            case .fantasy:
                                let scale = Double.random(in: 0.5 ... 1.1)
                                let offset = CGFloat.random(in: -2 ... 2)
                                
                                Group {
                                    FantasyView(
                                        symbol: symbol,
                                        textColor: textColor,
                                        fontName: fontName,
                                        fontSize: fontSize,
                                        isMask: true,
                                        delay: firstDelay
                                    ) {
                                        checkLastAnimation(textCount)
                                    }
                                    
                                    FantasyView(
                                        symbol: symbol,
                                        textColor: textColor,
                                        fontName: fontName,
                                        fontSize: fontSize,
                                        isMask: false,
                                        delay: secondDelay
                                    ) {
                                        checkLastAnimation(textCount)
                                    }
                                }
                                .scaleEffect(scale)
                                .offset(y: offset)
                            case .charmedLetter(let backgroundColor):
                                let scale = Double.random(in: 0.5 ... 1.1)
                                let offset = CGFloat.random(in: -2 ... 2)
                                
                                Group {
                                    CharmedLetterView(
                                        symbol: symbol,
                                        textColor: textColor,
                                        fontName: fontName,
                                        fontSize: fontSize,
                                        backgroundColor: backgroundColor,
                                        isMask: true,
                                        delay: firstDelay
                                    ) {
                                        checkLastAnimation(textCount)
                                    }
                                    
                                    CharmedLetterView(
                                        symbol: symbol,
                                        textColor: textColor,
                                        fontName: fontName,
                                        fontSize: fontSize,
                                        backgroundColor: nil,
                                        isMask: false,
                                        delay: secondDelay
                                    ) {
                                        checkLastAnimation(textCount)
                                    }
                                }
                                .scaleEffect(scale)
                                .offset(y: offset)
                            }
                        }
                    }
                }
            }
        }
        .fixedSize()
    }
    
    // MARK: - Initializers
    
    /// - Parameters:
    ///   - text: Text to be displayed.
    ///   - textColors: Colors for text. Default value `.black`.
    ///   - textAlignment: Text alignment.
    ///   - fontName: Font name.
    ///   - fontSize: Font size.
    ///   - minCharactersPerLine: Minimum number of characters per line.
    ///   This option is only enabled if the text is a single line.
    ///   If the text is multiline, then this option is disabled,
    ///   you have to take care of text wrapping in multiline text.
    ///   - magicType: View type for text.
    ///   - delayStart: Delay for text visibility.
    public init(
        text: String,
        textColors: [Color] = [.black],
        textAlignment: HorizontalAlignment = .center,
        fontName: String = "Baskerville",
        fontSize: CGFloat,
        minCharactersPerLine: Int = 20,
        magicType: MagicType = .charmed,
        delayStart: Double = 0,
        completion: (() -> Void)? = nil
    ) {
        self.text = text
        self.textColors = textColors
        self.textAlignment = textAlignment
        self.fontName = fontName
        self.fontSize = fontSize
        self.minCharactersPerLine = minCharactersPerLine
        self.magicType = magicType
        self.delayStart = delayStart
        self.completion = completion
    }
    
    // MARK: - Private Methods
    
    private func createTexts(
        text: String,
        minCharactersPerLine: Int
    ) -> [String] {
        var texts: [String] = []
        var lineOfText = ""
        
        let isNewline = text.first(where: { $0.isNewline }) != nil
        
        text.enumerated().forEach { index, character in
            if isNewline {
                if character == "\n" {
                    texts.append(lineOfText)
                    lineOfText = ""
                } else {
                    lineOfText.append(character)
                    
                    if index == text.count - 1 {
                        texts.append(lineOfText)
                    }
                }
            } else {
                if lineOfText.count >= minCharactersPerLine, character == " " {
                    texts.append(lineOfText)
                    lineOfText = ""
                } else {
                    lineOfText.append(character)
                    
                    if index == text.count - 1 {
                        texts.append(lineOfText)
                    }
                }
            }
        }
        
        return texts
    }
    
    private func checkLastAnimation(_ textCount: Int) {
        animationCounter += 1
        
        let animationCount: Int
        
        switch magicType {
        case .artLetter:
            animationCount = textCount
        default:
            animationCount = textCount * 2
        }
        
        if animationCounter == animationCount {
            completion?()
        }
    }
}

// MARK: - Preview Provider

struct MagicView_Previews: PreviewProvider {
    static var previews: some View {
        let text = "Life is like a box of chocolates, you never know what you’re gonna get."
        
        MagicView(
            text: text,
            fontSize: 28,
            minCharactersPerLine: 10
        )
    }
}
