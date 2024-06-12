//
//  MagicTextView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 20.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

/// Magic text view.
public struct MagicTextView: View {
    // MARK: - Public Enums
    
    public enum MagicType {
        case charmed
        case artLetter
        case bubble
        case fantasy
        case charmedLetter(backgroundColor: Color = RM.candy.color)
    }
    
    // MARK: - Property Wrappers
    
    @State private var animationCounter = 0
    
    // MARK: - Private Properties
    
    private let text: String
    private let textColors: [Color]
    private let textAlignment: TextAlignment
    private let fontName: String
    private let fontSize: CGFloat
    private let minCharactersPerLine: Int
    private let magicType: MagicType
    private let delayStart: Double
    private let completion: (() -> Void)?
    
    // MARK: - Initializers
    
    /// - Parameters:
    ///   - text: Text to be displayed.
    ///   - textColors: Colors for text.
    ///   - textAlignment: Text alignment.
    ///   - fontName: Font name.
    ///   - fontSize: Font size.
    ///   - minCharactersPerLine: Minimum number of characters per line.
    ///   This option is only enabled if the text is a single line.
    ///   If the text is multiline, then this option is disabled,
    ///   you have to take care of text wrapping in multiline text.
    ///   - magicType: View type for text.
    ///   - delayStart: Delay for text visibility.
    ///   - completion: A block object to be executed when the animation sequence ends.
    public init(
        text: String,
        textColors: [Color] = [RM.yinYang.color],
        textAlignment: TextAlignment = .center,
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
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: textAlignment.toHorizontalAlignment) {
            let linesOfText = createLinesOfText(
                text: text,
                minCharactersPerLine: minCharactersPerLine
            )
            
            let textCount = linesOfText.joined().count
            
            ForEach(linesOfText, id: \.self) { element in
                HStack(spacing: 0.5) {
                    ForEach(0 ..< element.count, id: \.self) { index in
                        let perLineDelay = delayStart +
                            Double.random(in: 0.1 ... 1.8)
                        
                        let firstDelay = perLineDelay + Double(index) * 0.5 *
                            Double.random(in: 0.004 ... 0.5)
                        
                        let secondDelay = perLineDelay + Double(index) *
                            Double.random(in: 0.1 ... 0.3)
                        
                        let symbol = String(Array(element)[index])
                        
                        let textColor = textColors.count == 1
                            ? textColors.first ?? .black
                            : textColors.randomElement() ?? .black
                        
                        switch magicType {
                        case .charmed:
                            charmed(
                                symbol: symbol,
                                textColor: textColor,
                                textCount: textCount,
                                firstDelay: firstDelay,
                                secondDelay: secondDelay
                            )
                        case .artLetter:
                            artLetter(
                                symbol: symbol,
                                textColor: textColor,
                                textCount: textCount,
                                firstDelay: firstDelay
                            )
                        case .bubble:
                            bubble(
                                symbol: symbol,
                                textColor: textColor,
                                textCount: textCount,
                                firstDelay: firstDelay,
                                secondDelay: secondDelay
                            )
                        case .fantasy:
                            fantasy(
                                symbol: symbol,
                                textColor: textColor,
                                textCount: textCount,
                                firstDelay: firstDelay,
                                secondDelay: secondDelay
                            )
                        case .charmedLetter(let backgroundColor):
                            charmedLetter(
                                symbol: symbol,
                                textColor: textColor,
                                textCount: textCount,
                                backgroundColor: backgroundColor,
                                firstDelay: firstDelay,
                                secondDelay: secondDelay
                            )
                        }
                    }
                }
            }
        }
        .fixedSize()
    }
    
    // MARK: - Private Methods
    
    private func createLinesOfText(
        text: String,
        minCharactersPerLine: Int
    ) -> [String] {
        var linesOfText: [String] = []
        var lineOfText = ""
        
        let isNewline = text.first(where: { $0.isNewline }) != nil
        
        text.enumerated().forEach { index, character in
            if isNewline {
                if character == "\n" {
                    linesOfText.append(lineOfText)
                    lineOfText = ""
                } else {
                    lineOfText.append(character)
                    
                    if index == text.count - 1 {
                        linesOfText.append(lineOfText)
                    }
                }
            } else {
                if lineOfText.count >= minCharactersPerLine, character == " " {
                    linesOfText.append(lineOfText)
                    lineOfText = ""
                } else {
                    lineOfText.append(character)
                    
                    if index == text.count - 1 {
                        linesOfText.append(lineOfText)
                    }
                }
            }
        }
        
        return linesOfText
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

// MARK: - Ext. Configure views

extension MagicTextView {
    private func charmed(
        symbol: String,
        textColor: Color,
        textCount: Int,
        firstDelay: Double,
        secondDelay: Double
    ) -> some View {
        ZStack {
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
        }
    }
    
    @ViewBuilder
    private func artLetter(
        symbol: String,
        textColor: Color,
        textCount: Int,
        firstDelay: Double
    ) -> some View {
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
    }
    
    private func bubble(
        symbol: String,
        textColor: Color,
        textCount: Int,
        firstDelay: Double,
        secondDelay: Double
    ) -> some View {
        ZStack {
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
        }
    }
    
    private func fantasy(
        symbol: String,
        textColor: Color,
        textCount: Int,
        firstDelay: Double,
        secondDelay: Double
    ) -> some View {
        ZStack {
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
        }
    }
    
    private func charmedLetter(
        symbol: String,
        textColor: Color,
        textCount: Int,
        backgroundColor: Color,
        firstDelay: Double,
        secondDelay: Double
    ) -> some View {
        ZStack {
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

// MARK: - Preview Provider

struct MagicTextView_Previews: PreviewProvider {
    static var previews: some View {
        let text = "Life is like a box of chocolates, you never know what you’re gonna get."
        
        let fontSize: CGFloat = 28
        let minCharactersPerLine = 10
        
        MagicTextView(
            text: text,
            fontSize: fontSize,
            minCharactersPerLine: minCharactersPerLine,
            magicType: .charmed
        )
        
        MagicTextView(
            text: text,
            textColors: [RM.yinYang.color.opacity(0.8)],
            fontSize: fontSize,
            minCharactersPerLine: minCharactersPerLine,
            magicType: .charmedLetter(backgroundColor: .blue)
        )
        
        MagicTextView(
            text: text,
            textColors: [RM.yinYang.color.opacity(0.8)],
            fontSize: fontSize,
            minCharactersPerLine: minCharactersPerLine,
            magicType: .bubble
        )
        
        MagicTextView(
            text: text,
            textColors: [RM.yinYang.color.opacity(0.8)],
            fontSize: fontSize,
            minCharactersPerLine: minCharactersPerLine,
            magicType: .fantasy
        )
        
        MagicTextView(
            text: text,
            textColors: [RM.yinYang.color.opacity(0.8)],
            fontSize: fontSize,
            minCharactersPerLine: minCharactersPerLine,
            magicType: .artLetter
        )
    }
}
