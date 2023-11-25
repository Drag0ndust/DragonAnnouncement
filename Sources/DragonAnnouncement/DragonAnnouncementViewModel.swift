//
//  DragonAnnouncementViewModel.swift
//
//
//  Created by Drag0ndust on 20.11.23.
//

import Foundation

// MARK: - DragonAnnouncementViewModel

@Observable
final class DragonAnnouncementViewModel {
    var showAnnouncement: Bool = false
    var announcement: Announcement?

    private var remoteAnnouncementService: RemoteAnnouncementService

    init(remoteAnnouncementService: RemoteAnnouncementService = .init()) {
        self.remoteAnnouncementService = remoteAnnouncementService
    }
}

extension DragonAnnouncementViewModel {
    func showAnnouncementOnScreen() {
        guard let announcement, !remoteAnnouncementService.wasShownBefore(announcement) else { return }

        showAnnouncement = true
        remoteAnnouncementService.markAsRead(announcement)
    }

    func dismissAnnouncement() {
        showAnnouncement = false
    }
}
