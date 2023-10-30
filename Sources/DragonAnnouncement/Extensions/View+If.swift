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
    func `if`<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        if ifTransform: (Self) -> TrueContent,
        else elseTransform: (Self) -> FalseContent
    ) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
}
