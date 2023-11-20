//
//  Announcement.swift
//
//
//  Created by Drag0ndust on 19.10.23.
//

import Foundation

// MARK: - Announcement

// Think about to change this into a protocol
public struct Announcement: Decodable {
    /// ID of the announcement
    public let id: UUID

    /// Title of the announcement
    public let title: String

    /// Message of the announcement
    public let message: String

    /// External URL which can be opened if provided
    public let urlToOpen: URL?

    /// Time after which the announcement will be shown
    /// - For local announcement it is the time after the view modifier appeared
    /// - For remote announcement it will be the time after the data was received till it gets presented
    public let displayAfter: TimeInterval

    /// Initializer
    /// - Parameters:
    ///   - id: Id of the announcement
    ///   - title: Title to show
    ///   - message: Message to show
    ///   - urlToOpen: URL to open
    ///   - displayAfter: Display announcement after this timespan
    public init(
        id: UUID = .init(),
        title: String,
        message: String,
        urlToOpen: URL? = nil,
        displayAfter: TimeInterval = 2
    ) {
        self.id = id
        self.title = title
        self.message = message
        self.urlToOpen = urlToOpen
        self.displayAfter = displayAfter
    }
}

extension Announcement {
    static func preview() -> Announcement {
        .init(title: "My Announcement Title",
              message: "My Announcement Message",
              urlToOpen: URL(
                  string: "https://github.com/Drag0ndust/DragonAnnouncement/tree/develop"
              ))
    }

    static func previewLongMessage() -> Announcement {
        .init(title: "My Announcement Title",
              message: "This is a very long message, which is more than one line to check how the linewrap and everything works.")
    }
}
