//
//  DragonAnnouncementViewModifier.swift
//
//  Created by Drag0ndust on 18.10.23.
//

import SwiftUI

@available(iOS 13.0, *)
public struct DragonAnnouncementViewModifier: ViewModifier {
    private var showAnnouncement: Binding<Bool>

    init(_ showAnnouncement: Binding<Bool>) {
        self.showAnnouncement = showAnnouncement
    }

    public func body(content: Content) -> some View {
        content
            .sheet(isPresented: showAnnouncement) {
                Text("Announcement")
            }
    }
}

@available(iOS 13.0, *)
public extension View {
    func announcement(isPresented: Binding<Bool>) -> some View {
        modifier(DragonAnnouncementViewModifier(isPresented))
    }
}
