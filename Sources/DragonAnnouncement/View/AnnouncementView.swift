//
//  AnnouncementView.swift
//
//
//  Created by Drag0ndust on 18.10.23.
//

import SwiftUI

struct AnnouncementView: View {
    let type: AnnouncementType
    let dismiss: () -> Void

    init(type: AnnouncementType, dismiss: @escaping () -> Void) {
        self.type = type
        self.dismiss = dismiss

        switch type {
            case let .local(announcement):
                title = announcement.title
                message = announcement.message
            case .remote:
                // Remote functionality will be implemented later
                break
        }
    }

    private var title: String = ""
    private var message: String = ""

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
                    Text("Cancel")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                Button {} label: {
                    Text("Show")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .shadow(color: .gray, radius: 8)
        )
    }
}

#Preview {
    Group {
        AnnouncementView(type: .preview(), dismiss: {})
        AnnouncementView(type: .previewLongMessage(), dismiss: {})
    }
}
