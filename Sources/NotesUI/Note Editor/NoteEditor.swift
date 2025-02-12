//
//  NoteEditor.swift
//  NotesUI
//
//  Created by James Wolfe on 19/01/2025.
//

import SwiftUI

public struct NoteEditor: UIViewRepresentable {

    @Binding var text: String
    @Binding var isEditing: Bool
    private let borderColor: UIColor
    private let textColor: UIColor
    private let backgroundColor: UIColor

    public init(text: Binding<String>,
         borderColor: UIColor = .gray.withAlphaComponent(0.4),
         textColor: UIColor = .black,
         backgroundColor: UIColor = .white,
         isEditing: Binding<Bool>) {
        _text = text
        _isEditing = isEditing
        self.borderColor = borderColor
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }

    public class Coordinator: NSObject, UITextViewDelegate {
        public var parent: NoteEditor

        public init(parent: NoteEditor) {
            self.parent = parent
        }

        public func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }

    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    public func makeUIView(context: Context) -> UINoteEditor {
        let textView = UINoteEditor.init(frame: .zero,
                                         textContainer: nil,
                                         borderColor: borderColor,
                                         textColor: textColor,
                                         backgroundColor: backgroundColor)
        textView.text = text
        textView.delegate = context.coordinator
        configureFirstResponder(for: textView)
        return textView
    }

    public func updateUIView(_ uiView: UINoteEditor, context: Context) {
        configureFirstResponder(for: uiView)
        return
    }
    
    private func configureFirstResponder(for uiView: UINoteEditor) {
        switch (isEditing, uiView.isFirstResponder) {
        case (true, false):
            uiView.becomeFirstResponder()
        case (true, true), (false, false):
            return
        case (false, true):
            uiView.resignFirstResponder()
        }
    }
    
}

#Preview {
    VStack {
        NoteEditor(text: .constant("Title\nbody"), isEditing: .constant(false))
    }
}
