//
//  RemoteAnnouncementService.swift
//
//
//  Created by Drag0ndust on 13.11.23.
//

import Foundation

struct RemoteAnnouncementService {
    static func loadRemoteAnnouncement(from url: URL) async -> Announcement? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            return try decoder.decode(Announcement.self, from: data)
        } catch {
            print("====> ", error)
            return nil
        }
    }
}
