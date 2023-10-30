//
//  ContentView.swift
//  ExampleApp
//
//  Created by Drag0ndust on 18.10.23.
//

import DragonAnnouncement
import SwiftUI

struct ContentView: View {
    @State private var showAnnouncement: Bool = false

    let exampleAnnouncement = Announcement(title: "Example", message: "This is an example announcement")

    var body: some View {
        VStack {
            Text("Example App")
            Text("Announcement will appear in 2 seconds")
        }
        .padding()
        .announcement(type: .local(announcement: exampleAnnouncement))
    }
}

#Preview {
    ContentView()
}
