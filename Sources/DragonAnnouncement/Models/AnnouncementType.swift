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
