//
//  AnnouncementStorageTests.swift
//
//
//  Created by Drag0ndust on 24.11.23.
//

@testable import DragonAnnouncement
import XCTest

final class AnnouncementStorageTests: XCTestCase {
    private var sut: AnnouncementStorage!
    private var userDefaultsMock: UserDefaults!

    override func setUpWithError() throws {
        userDefaultsMock = .init(suiteName: "AnnouncementStorageTests")
        sut = AnnouncementStorage(userDefaults: userDefaultsMock)
    }

    override func tearDownWithError() throws {
        userDefaultsMock.removePersistentDomain(forName: "AnnouncementStorageTests")
    }

    func test_add_announcement() {
        let announcement = Announcement.preview()
        sut.add(announcement)

        let value = userDefaultsMock.retrieveCodable(
            for: AnnouncementStorage.userDefaultsAnnouncementStorageKey,
            type: [UUID: Announcement].self
        )

        XCTAssertNotNil(value)
    }

    func test_add_announcement_twice_should_be_added_only_once() {
        let announcement = Announcement.preview()
        sut.add(announcement)
        sut.add(announcement)

        let value = userDefaultsMock.retrieveCodable(
            for: AnnouncementStorage.userDefaultsAnnouncementStorageKey,
            type: [UUID: Announcement].self
        )

        XCTAssertNotNil(value)
        XCTAssertEqual(value!.count, 1)
    }

    func test_contains_announcement() {
        let announcement = Announcement.preview()
        XCTAssertFalse(sut.contains(announcement))
        sut.add(announcement)
        XCTAssertTrue(sut.contains(announcement))
    }
}
