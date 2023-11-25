//
//  AnnouncementStorable.swift
//
//
//  Created by Drag0ndust on 23.11.23.
//

import Foundation

/// Protocol which defines the functionality of the internal storage
protocol AnnouncementStorable {
    /// Add an announcement to the storage
    /// - Parameter announcement: The announcement which should be stored
    mutating func add(_ announcement: Announcement)

    /// Check if the given announcement is in the storage
    /// - Parameter announcement: The announcement which should be checked
    /// - Returns: True if the announcement is available in the storage, false otherwise
    func contains(_ announcement: Announcement) -> Bool
}
