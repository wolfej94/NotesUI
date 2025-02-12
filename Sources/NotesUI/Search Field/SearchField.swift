//
//  SearchField.swift
//  NotesUI
//
//  Created by James Wolfe on 19/01/2025.
//

import SwiftUI

public struct SearchField: View {
    private let placeholder: String
    private let cancelButtonTitle: String
    private let backgroundColor: UIColor
    private let placeholderColor: UIColor
    private let textColor: UIColor
    private let borderColor: UIColor
    @Binding private var text: String
    @FocusState private var editing: Bool

    public init(placeholder: String,
                text: Binding<String>,
                cancelButtonTitle: String,
                backgroundColor: UIColor = .white,
                placeholderColor: UIColor = .gray.withAlphaComponent(0.4),
                textColor: UIColor = .black,
                borderColor: UIColor = .clear) {
        self.placeholder = placeholder
        _text = text
        self.cancelButtonTitle = cancelButtonTitle
        self.placeholderColor = placeholderColor
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.borderColor = borderColor
    }

    public var body: some View {
        HStack {
            HStack(spacing: 5) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color(uiColor: placeholderColor))
                TextField(placeholder, text: $text)
                    .foregroundStyle(Color(uiColor: textColor))
                    .font(.system(size: 17, weight: .regular))
                    .focused($editing)
                    .frame(height: 35)
                    .background(Color.clear)
            }
            .padding(.horizontal, 5)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color(uiColor: backgroundColor))
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color(uiColor: borderColor))
            }
            .zIndex(2)
            if editing {
                Button(cancelButtonTitle, action: {
                    editing = false
                })
                .transition(.move(edge: .trailing).combined(with: .opacity))
                .padding(.trailing, 5)
            }
        }
        .animation(.easeInOut, value: editing)
        .onTapGesture {
            editing = true
        }
        .padding(.horizontal, 9)
    }
}

#Preview {
    SearchField(placeholder: "Search...",
                text: .constant(""),
                cancelButtonTitle: "Cancel")
}
