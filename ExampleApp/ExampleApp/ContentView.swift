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

    var body: some View {
        Button {
            showAnnouncement = true
        } label: {
            Text("Show announcement")
        }
        .padding()
        .announcement(isPresented: $showAnnouncement)
    }
}

#Preview {
    ContentView()
}
