//
//  ExampleFantasyView.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 20.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI
import MagicText

struct ExampleFantasyView: View {
    // MARK: - Private Properties
    
    private let singleLineExampleText = "Life is like a box of chocolates, you never know what you’re gonna get."
    
    private let multiLineExampleText = """
    Life is like a box
    of chocolates, you never
    know what you’re
    gonna get.
    """
    
    private let colors = [
        RM.candy, RM.coffee, RM.flower, RM.forest, RM.newyork,
        RM.night, RM.sky, RM.smoke, RM.theia, RM.venus
    ]
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 25) {
            // Fantasy magic text.
            MagicTextView(
                text: singleLineExampleText,
                textColors: [RM.yinYang.color.opacity(0.8)],
                fontSize: 28,
                magicType: .fantasy
            ) {
                print("Animation finished.")
            }
            .padding(.bottom)
            
            // Fantasy magic text with different colors.
            MagicTextView(
                text: multiLineExampleText,
                textColors: colors.map { $0.color },
                fontSize: 28,
                magicType: .fantasy,
                delayStart: 5
            ) {
                print("Animation finished.")
            }
        }
    }
}

// MARK: - Preview Provider

struct ExampleFantasyView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleFantasyView()
    }
}
