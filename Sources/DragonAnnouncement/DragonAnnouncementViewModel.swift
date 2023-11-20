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
}

extension DragonAnnouncementViewModel {
    func toggleAnnouncement() {
        showAnnouncement.toggle()
    }
}
