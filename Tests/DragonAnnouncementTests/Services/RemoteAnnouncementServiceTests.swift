//
//  RemoteAnnouncementServiceTests.swift
//
//
//  Created by Drag0ndust on 13.11.23.
//

@testable import DragonAnnouncement
import XCTest

final class RemoteAnnouncementServiceTests: XCTestCase {
    func test_loading_of_remote_announcement() async {
        let url =
            URL(
                string: "https://raw.githubusercontent.com/Drag0ndust/DragonAnnouncement/develop/Tests/Testdata/RemoteAnnouncementExample.json"
            )!
        let announcement = await RemoteAnnouncementService.loadRemoteAnnouncement(from: url)

        XCTAssertNotNil(announcement)
        XCTAssertEqual(announcement!.id.uuidString, "C58DC48E-102C-4DEA-AF25-7C5DFEA32F54")
    }
}
