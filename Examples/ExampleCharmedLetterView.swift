//
//  ExampleCharmedLetterView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 20.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

#if os(iOS)
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
    
    private let colors = [
        candy, coffee, flower, forest, newyork,
        night, sky, smoke, theia, venus
    ]
    
    // MARK: - body Property
    var body: some View {
        VStack(spacing: 25) {
            // Charmed letter magic text.
            MagicView(
                text: singleLineExampleText,
                textColors: [.black.opacity(0.7)],
                fontSize: 30,
                magicType: .charmedLetter()
            ) {
                print("Animation finished")
            }
            .padding(.bottom)
            
            // Charmed letter magic text with different colors.
            MagicView(
                text: multiLineExampleText,
                textColors: colors.map { Color($0) },
                fontSize: 30,
                magicType: .charmedLetter(backgroundColor: .blue),
                delayStart: 5
            ) {
                print("Animation finished")
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
#endif
