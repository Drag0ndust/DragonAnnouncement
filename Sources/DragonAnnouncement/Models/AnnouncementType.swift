//
//  AnnouncementType.swift
//
//
//  Created by Drag0ndust on 19.10.23.
//

import Foundation

// MARK: - AnnouncementType

/// The type if an announcement
/// - it can be a local created one
/// - or a remote one
public enum AnnouncementType {
    case local(announcement: Announcement)
    case remote(url: URL)
}

#if DEBUG
    extension AnnouncementType {
        static func preview() -> AnnouncementType {
            .local(announcement: .init(title: "My Announcement Title",
                                       message: "My Announcement Message"))
        }

        static func previewLongMessage() -> AnnouncementType {
            .local(announcement: .init(title: "My Announcement Title",
                                       message: "This is a very long message, which is more than one line to check how the linewrap and everything works."))
        }
    }
#endif
