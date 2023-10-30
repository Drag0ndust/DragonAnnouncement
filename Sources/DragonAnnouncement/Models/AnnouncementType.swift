//
//  AnnouncementType.swift
//
//
//  Created by Drag0ndust on 19.10.23.
//

import Foundation

/// The type if an announcement
/// - it can be a local created one
/// - or a remote one
public enum AnnouncementType {
    case local(announcement: Announcement)
    case remote(url: URL)
}

extension AnnouncementType {
    static func preview() -> AnnouncementType {
        .local(announcement: .init(id: .init(), title: "My Announcement Title", message: "My Announcement Message", urlToOpen: nil))
    }
}
