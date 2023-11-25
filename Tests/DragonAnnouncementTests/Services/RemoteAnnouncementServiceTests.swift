//
//  RemoteAnnouncementServiceTests.swift
//
//
//  Created by Drag0ndust on 13.11.23.
//

@testable import DragonAnnouncement
import XCTest

// MARK: - RemoteAnnouncementServiceTests

final class RemoteAnnouncementServiceTests: XCTestCase {
    private var sut: RemoteAnnouncementService!
    private var storageMock: AnnouncementStorable!

    override func setUp() async throws {
        storageMock = StorageMock()
        sut = RemoteAnnouncementService(announcementStorage: storageMock)
    }

    func test_loading_of_remote_announcement() async {
        let url =
            URL(
                string: "https://raw.githubusercontent.com/Drag0ndust/DragonAnnouncement/develop/Tests/Testdata/RemoteAnnouncementExample.json"
            )!
        let announcement = await sut.loadRemoteAnnouncement(from: url)

        XCTAssertNotNil(announcement)
        XCTAssertEqual(announcement!.id.uuidString, "C58DC48E-102C-4DEA-AF25-7C5DFEA32F54")
    }

    func test_mark_remote_announcement_as_read() {
        let announcement = Announcement.preview()
        sut.markAsRead(announcement)

        XCTAssertTrue(storageMock.contains(announcement))
    }
}

// MARK: - StorageMock

class StorageMock: AnnouncementStorable {
    var announcements: [Announcement] = []

    func add(_ announcement: Announcement) {
        announcements.append(announcement)
    }

    func contains(_ announcement: Announcement) -> Bool {
        let containedAnnoucnement = announcements.first {
            $0.id == announcement.id
        }

        return containedAnnoucnement != nil
    }
}
