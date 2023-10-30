//
//  Announcement.swift
//
//
//  Created by Drag0ndust on 19.10.23.
//

import Foundation

// Think about to change this into a protocol
public struct Announcement: Decodable {
    // ID of the announcement 
    let id: UUID
    
    // Title of the announcement
    let title: String
    
    // Message of the announcement
    let message: String
    
    // External URL which can be opened if provided
    let urlToOpen: URL?
}
