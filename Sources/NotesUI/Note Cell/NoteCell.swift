//
//  NoteCell.swift
//  NotesUI
//
//  Created by James Wolfe on 19/01/2025.
//

import SwiftUI

public struct NoteCell: View {

    private let noteTitle: String
    private let noteBody: String
    private let textColor: UIColor
    private let backgroundColor: UIColor
    private var bodyColor: UIColor {
        textColor.withAlphaComponent(0.5)
    }

    public init(title: String,
                body: String,
                textColor: UIColor,
                backgroundColor: UIColor) {
        self.noteTitle = title
        self.noteBody = body
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(noteTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .foregroundStyle(Color(uiColor: textColor))
                .font(.system(size: 17, weight: .regular))
            Text(noteBody)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .font(.system(size: 14, weight: .light))
                .foregroundStyle(Color(uiColor: bodyColor))
                .lineLimit(1)
        }
        .background {
            Color(uiColor: backgroundColor)
        }
    }
}

#Preview {
    NoteCell(
        title: "Test Title",
        body: """
        Test Body
        """,
        textColor: .blue,
        backgroundColor: .brown
    )
}
