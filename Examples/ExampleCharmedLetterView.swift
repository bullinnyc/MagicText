//
//  ExampleCharmedLetterView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 20.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI
import MagicText

struct ExampleCharmedLetterView: View {
    // MARK: - Private Properties
    
    private let singleLineExampleText = "Life is like a box of chocolates, you never know what you’re gonna get."
    
    private let multiLineExampleText = """
    Life is like a box
    of chocolates, you never
    know what you’re
    gonna get.
    """
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 25) {
            // Charmed letter magic text.
            MagicTextView(
                text: singleLineExampleText,
                textColors: [RM.yinYang.color.opacity(0.8)],
                fontSize: 28,
                magicType: .charmedLetter()
            ) {
                print("Animation finished.")
            }
            .padding(.bottom)
            
            // Charmed letter magic text with different colors.
            MagicTextView(
                text: multiLineExampleText,
                textColors: [RM.yinYang.color.opacity(0.8)],
                fontSize: 28,
                magicType: .charmedLetter(backgroundColor: .blue),
                delayStart: 5
            ) {
                print("Animation finished.")
            }
        }
    }
}

// MARK: - Preview Provider

struct ExampleCharmedLetterView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleCharmedLetterView()
    }
}
