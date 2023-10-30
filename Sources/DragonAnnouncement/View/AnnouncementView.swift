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
    let type: AnnouncementType
    let dismiss: () -> Void

    init(type: AnnouncementType, dismiss: @escaping () -> Void) {
        self.type = type
        self.dismiss = dismiss

        switch type {
            case let .local(announcement):
                title = announcement.title
                message = announcement.message
                urlToOpen = announcement.urlToOpen
            case .remote:
                // Remote functionality will be implemented later
                break
        }
    }

    private var title: String = ""
    private var message: String = ""
    private var urlToOpen: URL? = nil

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
        AnnouncementView(type: .preview(), dismiss: {})
        AnnouncementView(type: .previewLongMessage(), dismiss: {})
    }
}
