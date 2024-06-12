//
//  ResourcesManager.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 24.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// Resources manager typealias.
public typealias RM = ResourcesManager

/// Resources manager.
public final class ResourcesManager {
    // MARK: - Public Properties
    
    /// An object that stores color data.
    public static let yinYang = UIColor(
        named: "yinYang",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()
    
    /// An object that stores color data.
    public static let candy = UIColor(
        named: "candy",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()

    /// An object that stores color data.
    public static let coffee = UIColor(
        named: "coffee",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()

    /// An object that stores color data.
    public static let flower = UIColor(
        named: "flower",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()

    /// An object that stores color data.
    public static let forest = UIColor(
        named: "forest",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()

    /// An object that stores color data.
    public static let newyork = UIColor(
        named: "newyork",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()

    /// An object that stores color data.
    public static let night = UIColor(
        named: "night",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()

    /// An object that stores color data.
    public static let sky = UIColor(
        named: "sky",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()

    /// An object that stores color data.
    public static let smoke = UIColor(
        named: "smoke",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()

    /// An object that stores color data.
    public static let theia = UIColor(
        named: "theia",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()

    /// An object that stores color data.
    public static let venus = UIColor(
        named: "venus",
        in: Bundle.module,
        compatibleWith: nil
    ) ?? UIColor()
}
#endif
