//
//  AnnouncementTests.swift
//
//
//  Created by Drag0ndust on 09.11.23.
//

import DragonAnnouncement
import XCTest

// MARK: - AnnouncementTests

final class AnnouncementTests: XCTestCase {
    private var sut: Announcement!

    let remoteAnnouncementString: String = """
    {
        "title": "Test Announcement",
        "urlToOpen": "https://github.com/Drag0ndust/DragonAnnouncement",
        "displayAfter": 0.5,
        "message": "This is a test announcement",
        "id": "C58DC48E-102C-4DEA-AF25-7C5DFEA32F54"
    }
    """
}

// MARK: - JSON Decoding

extension AnnouncementTests {
    func test_decode() throws {
        guard let jsonData = remoteAnnouncementString.data(using: .utf8) else {
            XCTFail("Error while loading json data")
            return
        }

        sut = try JSONDecoder().decode(Announcement.self, from: jsonData)

        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.title, "Test Announcement")
        XCTAssertEqual(sut.urlToOpen?.absoluteString, "https://github.com/Drag0ndust/DragonAnnouncement")
        XCTAssertEqual(sut.displayAfter, 0.5)
        XCTAssertEqual(sut.message, "This is a test announcement")
        XCTAssertEqual(sut.id, UUID(uuidString: "C58DC48E-102C-4DEA-AF25-7C5DFEA32F54"))
    }
}
