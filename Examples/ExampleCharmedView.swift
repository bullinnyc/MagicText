//
//  ExampleCharmedView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 20.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

#if os(iOS)
import SwiftUI
import MagicText

struct ExampleCharmedView: View {
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
            // Charmed magic text (default).
            MagicView(
                text: singleLineExampleText,
                fontSize: 30
            ) {
                print("Animation finished")
            }
            .padding(.bottom)
            
            // Charmed magic text with different colors.
            MagicView(
                text: multiLineExampleText,
                textColors: [.black, .red, .orange, .yellow, .green, .blue],
                fontSize: 30,
                delayStart: 5
            ) {
                print("Animation finished")
            }
        }
    }
}

// MARK: - Preview Provider
struct ExampleCharmedView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleCharmedView()
    }
}
#endif
