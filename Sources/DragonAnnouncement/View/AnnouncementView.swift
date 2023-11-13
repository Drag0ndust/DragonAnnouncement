//
//  AnnouncementView.swift
//
//
//  Created by Drag0ndust on 18.10.23.
//

import SwiftUI

// MARK: - AnnouncementView

struct AnnouncementView: View {
    @Environment(\.openURL) var openURL
    let dismiss: () -> Void

    private let announcement: Announcement
    private var title: String = ""
    private var message: String = ""
    private var urlToOpen: URL? = nil

    init(_ announcement: Announcement, dismiss: @escaping () -> Void) {
        self.announcement = announcement
        self.dismiss = dismiss

        title = announcement.title
        message = announcement.message
        urlToOpen = announcement.urlToOpen
    }

    var body: some View {
        VStack(spacing: 15) {
            Text("📣")
                .font(.title)
                .padding()
                .shadow(radius: 4)
            Text(title)
                .font(.headline)
            Text(message)
                .font(.callout)
            HStack(spacing: 20) {
                Button {
                    dismiss()
                } label: {
                    Text("Close")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                }
                .if(urlToOpen != nil) { button in
                    button.buttonStyle(.bordered)
                } else: { button in
                    button.buttonStyle(.borderedProminent)
                }

                if let urlToOpen {
                    Button {
                        openURL(urlToOpen)
                    } label: {
                        Text("Show")
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color(UIColor.systemBackground))
                .shadow(color: Color(UIColor.systemGray), radius: 8)
        )
    }
}

#Preview {
    VStack(spacing: 50) {
        AnnouncementView(.preview(), dismiss: {})
        AnnouncementView(.previewLongMessage(), dismiss: {})
    }
}
