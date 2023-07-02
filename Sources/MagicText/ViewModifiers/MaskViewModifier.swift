//
//  MaskViewModifier.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 21.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

private struct MaskViewModifier: ViewModifier {
    // MARK: - Public Properties
    
    let text: String
    let fontName: String
    let fontScale: CGFloat
    
    // MARK: - Body Method
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .mask {
                    Text(text)
                        .font(.custom(fontName, size: fontScale))
                }
        } else {
            content
                .mask(
                    Text(text)
                        .font(.custom(fontName, size: fontScale))
                )
        }
    }
}

// MARK: - Ext. View

extension View {
    func mask(
        text: String,
        fontName: String,
        fontScale: CGFloat
    ) -> some View {
        modifier(
            MaskViewModifier(
                text: text,
                fontName: fontName,
                fontScale: fontScale
            )
        )
    }
}
