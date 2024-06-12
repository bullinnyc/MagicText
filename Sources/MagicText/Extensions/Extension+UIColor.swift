//
//  Extension+UIColor.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 12.06.2024.
//  Copyright © 2024 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)
extension UIColor {
    // MARK: - Public Properties
    
    /// Creates a color from a UIKit color.
    public var color: Color {
        if #available(
            iOS 15.0,
            macOS 12.0,
            tvOS 15.0,
            watchOS 8.0,
            visionOS 1.0,
            *
        ) {
            Color(uiColor: self)
        } else {
            Color(self)
        }
    }
}
#elseif canImport(AppKit)
import AppKit

extension NSColor {
    // MARK: - Public Properties
    
    /// Creates a color from an AppKit color.
    public var color: Color {
        if #available(
            iOS 15.0,
            macOS 12.0,
            tvOS 15.0,
            watchOS 8.0,
            visionOS 1.0,
            *
        ) {
            Color(nsColor: self)
        } else {
            Color(self)
        }
    }
}
#endif
