//
//  DragonAnnouncementViewModifier.swift
//
//  Created by Drag0ndust on 18.10.23.
//

import SwiftUI

// MARK: - DragonAnnouncementViewModifier

@available(iOS 13.0, *)
public struct DragonAnnouncementViewModifier: ViewModifier {
    @State private var showAnnouncement: Bool = false
    let type: AnnouncementType

    public func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                AnnouncementView(type: type) {
                    withAnimation(.easeInOut(duration: 0.75)) {
                        showAnnouncement.toggle()
                    }
                }
                .padding(.horizontal)
            }
            .offset(y: showAnnouncement ? 0 : 1000)
        }
        .onAppear {
            if case .local = type {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.showAnnouncementView()
                }
            }
        }
    }

    func showAnnouncementView() {
        withAnimation(.easeInOut(duration: 0.75)) {
            showAnnouncement.toggle()
        }
    }
}

@available(iOS 13.0, *)
public extension View {
    func announcement(type: AnnouncementType) -> some View {
        modifier(DragonAnnouncementViewModifier(type: type))
    }
}
