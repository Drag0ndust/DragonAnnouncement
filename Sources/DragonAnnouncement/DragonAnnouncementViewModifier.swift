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
    private var announcement: Announcement?

    /// Initializer
    /// - Parameter type: Announcement type
    public init(type: AnnouncementType) {
        self.type = type
    }

    public func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                if let announcement {
                    AnnouncementView(announcement) {
                        withAnimation(.easeInOut(duration: 0.75)) {
                            showAnnouncement.toggle()
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .offset(y: showAnnouncement ? 0 : 1000)
        }
        .onAppear {
            switch type {
                case let .local(announcement):
                    show(announcement)
                case let .remote(url):
                    // load data from url and decide then to show it
                    break
            }
        }
    }

    /// Show a announcement according to its settings
    /// - Parameter announcement: The announcement which should be shown
    private func show(_ announcement: Announcement) {
        DispatchQueue.main.asyncAfter(deadline: .now() + announcement.displayAfter) {
            withAnimation(.easeInOut(duration: 0.75)) {
                showAnnouncement.toggle()
            }
        }
    }
}

@available(iOS 13.0, *)
public extension View {
    /// Convenience method for adding the `DragonAnnouncementViewModifier`
    /// - Parameter type: Type of the annoucnement: local or remote
    /// - Returns: View with the announcement view attached
    func announcement(type: AnnouncementType) -> some View {
        modifier(DragonAnnouncementViewModifier(type: type))
    }
}
