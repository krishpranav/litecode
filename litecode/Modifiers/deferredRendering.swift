//
//  deferredRendering.swift
//  litecode
//
//  Created by Krisna Pranav on 28/04/24.
//

import Foundation
import SwiftUI

private struct DeferredViewModifier: ViewModifier {
    let threshold: Double
    
    func body(content: Content) -> some View {
        _content(context)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + threshold) {
                    self.shouldRender = true
                }
            }
    }
    
    @ViewBuilder
    private func _content(_ content: Content) -> some View {
        if shouldRender {
            content
        } else {
            content
                .hidden()
        }
    }
    
    @State private var shouldRender = false
}

extension View {
    func deferredRendering(for seconds: Double) -> some View {
        modifier(DeferredViewModifier(threshold: seconds))
    }
}
