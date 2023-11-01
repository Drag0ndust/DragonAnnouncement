//
//  View+If.swift
//
//
//  Created by Drag0ndust on 30.10.23.
//

import SwiftUI

/// Source: https://stackoverflow.com/a/76436298
extension View {
    @ViewBuilder
    func `if`(
        _ condition: Bool,
        if ifTransform: (Self) -> some View,
        else elseTransform: (Self) -> some View
    ) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
}
