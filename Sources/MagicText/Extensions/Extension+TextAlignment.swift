//
//  Extension+TextAlignment.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 10.11.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

extension TextAlignment {
    // MARK: - Public Properties
    
    var toHorizontalAlignment: HorizontalAlignment {
        switch self {
        case .leading:
            .leading
        case .center:
            .center
        case .trailing:
            .trailing
        }
    }
}
