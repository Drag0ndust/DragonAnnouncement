//
//  AnnouncementStorage.swift
//
//
//  Created by Drag0ndust on 23.11.23.
//

import Foundation

// MARK: - AnnouncementStorage

public struct AnnouncementStorage {
    /// Key with which the data gets stored
    public static let userDefaultsAnnouncementStorageKey = "DragonAnnouncment"
    private let userDefaults: UserDefaults
    private var announcements: [UUID: Announcement] {
        get {
            userDefaults.retrieveCodable(
                for: AnnouncementStorage.userDefaultsAnnouncementStorageKey,
                type: [UUID: Announcement].self
            ) ?? [:]
        }

        set {
            userDefaults.storeCodable(newValue, key: AnnouncementStorage.userDefaultsAnnouncementStorageKey)
        }
    }

    /// Initializer
    /// - Parameter userDefaults: The UserDefaults which should be used, default is an internal not standard
    /// UserDefaults suite
    public init(userDefaults: UserDefaults = .init(suiteName: "DragonAnnouncementUserDefaults")!) {
        self.userDefaults = userDefaults
    }
}

// MARK: AnnouncementStorable

extension AnnouncementStorage: AnnouncementStorable {
    public mutating func add(_ announcement: Announcement) {
        announcements[announcement.id] = announcement
    }

    public func contains(_ announcement: Announcement) -> Bool {
        announcements.keys.contains { $0 == announcement.id }
    }
}
