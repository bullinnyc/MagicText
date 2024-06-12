//
//  AnimationCompletionAnimatableModifier.swift
//  MagicText
//
//  Created by Dmitry Kononchuk on 21.04.2023.
//  Copyright © 2023 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

struct AnimationCompletionAnimatableModifier<Value>:
    AnimatableModifier where Value: VectorArithmetic {
    // MARK: - Animatable Protocol Properties
    
    var animatableData: Value {
        didSet {
            notifyCompletionIfFinished()
        }
    }
    
    // MARK: - Private Properties
    
    private let targetValue: Value
    private let completion: () -> Void
    
    // MARK: - Initializers
    
    init(value: Value, completion: @escaping () -> Void) {
        self.completion = completion
        animatableData = value
        targetValue = value
    }
    
    // MARK: - Body Method
    
    func body(content: Content) -> some View {
        content
    }
    
    // MARK: - Private Methods
    
    private func notifyCompletionIfFinished() {
        guard animatableData == targetValue else { return }
        
        DispatchQueue.main.async {
            completion()
        }
    }
}

// MARK: - Ext. View

extension View {
    func onAnimationCompleted<Value: VectorArithmetic>(
        value: Value,
        completion: @escaping () -> Void
    ) -> ModifiedContent<Self, AnimationCompletionAnimatableModifier<Value>> {
        modifier(
            AnimationCompletionAnimatableModifier(
                value: value,
                completion: completion
            )
        )
    }
}
