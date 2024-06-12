//
//  ResourcesManager.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 24.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

#if canImport(UIKit)
import UIKit

#if os(watchOS)
import SwiftUI
#endif

/// Resources manager typealias.
public typealias RM = ResourcesManager

/// Resources manager.
public final class ResourcesManager {
    // MARK: - Public Properties
    
    /// An object that stores color data.
    public static let yinYang = getColor(with: "yinYang")
    
    /// An object that stores color data.
    public static let candy = getColor(with: "candy")
    
    /// An object that stores color data.
    public static let coffee = getColor(with: "coffee")
    
    /// An object that stores color data.
    public static let flower = getColor(with: "flower")
    
    /// An object that stores color data.
    public static let forest = getColor(with: "forest")
    
    /// An object that stores color data.
    public static let newyork = getColor(with: "newyork")
    
    /// An object that stores color data.
    public static let night = getColor(with: "night")
    
    /// An object that stores color data.
    public static let sky = getColor(with: "sky")
    
    /// An object that stores color data.
    public static let smoke = getColor(with: "smoke")
    
    /// An object that stores color data.
    public static let theia = getColor(with: "theia")
    
    /// An object that stores color data.
    public static let venus = getColor(with: "venus")
    
    // MARK: - Public Methods
    
    /// Get image by name.
    ///
    /// - Parameter name: Image name.
    ///
    /// - Returns: An initialized image object or `nil` if the object was not found in the resources.
    static func image(_ name: String) -> UIImage? {
        UIImage(named: name, in: Bundle.module, with: nil)
    }
    
    // MARK: - Private Methods
    
    private static func getColor(with name: String) -> UIColor {
        #if os(watchOS)
        UIColor(Color(name, bundle: Bundle.module))
        #elseif os(iOS) || os(tvOS) || os(visionOS)
        UIColor(
            named: name,
            in: Bundle.module,
            compatibleWith: nil
        ) ?? UIColor()
        #endif
    }
}
#elseif canImport(AppKit)
import AppKit

/// Resources manager typealias.
public typealias RM = ResourcesManager

/// Resources manager.
public final class ResourcesManager {
    // MARK: - Public Properties
    
    /// An object that stores color data.
    public static let yinYang = NSColor(
        named: NSColor.Name("yinYang"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let candy = NSColor(
        named: NSColor.Name("candy"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let coffee = NSColor(
        named: NSColor.Name("coffee"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let flower = NSColor(
        named: NSColor.Name("flower"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let forest = NSColor(
        named: NSColor.Name("forest"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let newyork = NSColor(
        named: NSColor.Name("newyork"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let night = NSColor(
        named: NSColor.Name("night"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let sky = NSColor(
        named: NSColor.Name("sky"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let smoke = NSColor(
        named: NSColor.Name("smoke"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let theia = NSColor(
        named: NSColor.Name("theia"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    /// An object that stores color data.
    public static let venus = NSColor(
        named: NSColor.Name("venus"),
        bundle: Bundle.module
    ) ?? NSColor()
    
    // MARK: - Public Methods
    
    /// Get image by name.
    ///
    /// - Parameter name: Image name.
    ///
    /// - Returns: An initialized image object or `nil` if the object was not found in the resources.
    static func image(_ name: String) -> NSImage? {
        Bundle.module.image(forResource: NSImage.Name(name))
    }
}
#endif
