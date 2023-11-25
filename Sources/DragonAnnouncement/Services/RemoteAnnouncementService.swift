//
//  RemoteAnnouncementService.swift
//
//
//  Created by Drag0ndust on 13.11.23.
//

import Foundation

// MARK: - RemoteAnnouncementService

public struct RemoteAnnouncementService {
    private var announcementStorage: AnnouncementStorable

    init(announcementStorage: AnnouncementStorable = AnnouncementStorage()) {
        self.announcementStorage = announcementStorage
    }

    /// Load announcement from a remote URL
    /// - Parameter url: The url where the json file is hosted
    /// - Returns: The decoded announcement if the url points to the announcement json, nil otherwise
    func loadRemoteAnnouncement(from url: URL) async -> Announcement? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            return try decoder.decode(Announcement.self, from: data)
        } catch {
            print("====> ", error)
            return nil
        }
    }

    /// Mark an announcement as read
    /// - Parameter announcement: The announcement which should be markes as read
    mutating func markAsRead(_ announcement: Announcement) {
        announcementStorage.add(announcement)
    }

    /// Check if the announcement was shown before
    /// - Parameter announcement: The announcement which should be checked
    /// - Returns: True if the announcement was shown before, false otherwise
    func wasShownBefore(_ announcement: Announcement) -> Bool {
        announcementStorage.contains(announcement)
    }
}
