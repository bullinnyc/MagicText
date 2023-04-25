//
//  ExampleArtLetterView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 20.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

#if os(iOS)
import SwiftUI
import MagicText

struct ExampleArtLetterView: View {
    // MARK: - Private Properties
    private let singleLineExampleText = "Life is like a box of chocolates, you never know what you’re gonna get."
    
    private let multiLineExampleText = """
    Life is like a box
    of chocolates, you never
    know what you’re
    gonna get.
    """
    
    private let colors = [
        candy, coffee, flower, forest, newyork,
        night, sky, smoke, theia, venus
    ]
    
    // MARK: - body Property
    var body: some View {
        VStack(spacing: 25) {
            // Art letter magic text.
            MagicView(
                text: singleLineExampleText,
                textColors: [.black.opacity(0.7)],
                fontSize: 25,
                magicType: .artLetter
            ) {
                print("Animation finished")
            }
            .padding(.bottom)
            
            // Art letter magic text with different colors.
            MagicView(
                text: multiLineExampleText,
                textColors: colors.map { Color($0) },
                fontSize: 25,
                magicType: .artLetter,
                delayStart: 5
            ) {
                print("Animation finished")
            }
        }
    }
}

// MARK: - Preview Provider
struct ExampleArtLetterView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleArtLetterView()
    }
}
#endif
