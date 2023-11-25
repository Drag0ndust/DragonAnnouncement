//
//  DragonAnnouncementViewModelTests.swift
//
//
//  Created by Drag0ndust on 20.11.23.
//

@testable import DragonAnnouncement
import XCTest

final class DragonAnnouncementViewModelTests: XCTestCase {
    private var sut: DragonAnnouncementViewModel!
    private var userDefaultsMock: UserDefaults!

    override func setUpWithError() throws {
        userDefaultsMock = .init(suiteName: "DragonAnnouncementViewModelTests")!
        sut = DragonAnnouncementViewModel()
    }

    override func tearDownWithError() throws {
        userDefaultsMock.removePersistentDomain(forName: "DragonAnnouncementViewModelTests")
    }

    func test_init() {
        XCTAssertFalse(sut.showAnnouncement)
        XCTAssertNil(sut.announcement)
    }

    func test_showAnnouncementOnScreen() {
        sut.announcement = Announcement.preview()
        XCTAssertFalse(sut.showAnnouncement)
        sut.showAnnouncementOnScreen()
        XCTAssertTrue(sut.showAnnouncement)
    }

    func test_dismissAnnouncement() {
        sut.showAnnouncement = true
        sut.dismissAnnouncement()
        XCTAssertFalse(sut.showAnnouncement)
    }

    func test_showAnnouncement_marks_announcement_as_read() {
        let announcement = Announcement.preview()
        let storage = AnnouncementStorage(userDefaults: userDefaultsMock)
        let remoteService: RemoteAnnouncementService = .init(announcementStorage: storage)
        sut = .init(remoteAnnouncementService: remoteService)
        sut.announcement = announcement
        XCTAssertFalse(storage.contains(announcement))
        sut.showAnnouncementOnScreen()
        XCTAssertTrue(storage.contains(announcement))
        XCTAssertTrue(sut.showAnnouncement)
    }

    func test_showsAnnouncement_announcement_was_already_markedAsRead() {
        let announcement = Announcement.preview()
        var storage = AnnouncementStorage(userDefaults: userDefaultsMock)
        let remoteService: RemoteAnnouncementService = .init(announcementStorage: storage)
        sut = .init(remoteAnnouncementService: remoteService)
        sut.announcement = announcement
        storage.add(announcement)
        XCTAssertFalse(sut.showAnnouncement)
        sut.showAnnouncementOnScreen()
        XCTAssertFalse(sut.showAnnouncement)
    }
}
