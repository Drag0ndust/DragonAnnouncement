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

    override func setUpWithError() throws {
        sut = DragonAnnouncementViewModel()
    }

    override func tearDownWithError() throws {}

    func test_init() {
        XCTAssertFalse(sut.showAnnouncement)
        XCTAssertNil(sut.announcement)
    }

    func test_toggleAnnouncement() {
        XCTAssertFalse(sut.showAnnouncement)
        sut.toggleAnnouncement()
        XCTAssertTrue(sut.showAnnouncement)
        sut.toggleAnnouncement()
        XCTAssertFalse(sut.showAnnouncement)
    }
}
