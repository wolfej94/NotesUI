//
//  UINoteEditor.swift
//  NotesUI
//
//  Created by James Wolfe on 19/01/2025.
//

import UIKit

public class UINoteEditor: UITextView, UITextViewDelegate {

    public override var text: String? {
        didSet {
            applyBoldToFirstLine()
        }
    }

    public init(frame: CGRect,
                textContainer: NSTextContainer?,
                borderColor: UIColor = .gray.withAlphaComponent(0.4),
                textColor: UIColor = .black,
                backgroundColor: UIColor = .white) {
        super.init(frame: frame, textContainer: textContainer)
        setup(borderColor: borderColor, textColor: textColor, backgroundColor: backgroundColor)
        if let text, text.isEmpty {
            font = UIFont.boldSystemFont(ofSize: 28)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func setup(borderColor: UIColor? = nil,
                       textColor: UIColor,
                       backgroundColor: UIColor? = nil) {
        self.textColor = textColor
        self.borderStyle = .none
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor?.cgColor ?? UIColor.clear.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 8
        self.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        NotificationCenter.default.addObserver(self, selector: #selector(applyBoldToFirstLine), name: UITextView.textDidChangeNotification, object: self)
    }

    @objc
    private func applyBoldToFirstLine() {
        guard let text = self.text else { return }

        let attributedString = NSMutableAttributedString(string: text)
        let defaultFont = UIFont.systemFont(ofSize: 17)
        let boldFont = UIFont.boldSystemFont(ofSize: 28)

        let fullRange = NSRange(location: 0, length: attributedString.length)
        attributedString.addAttribute(.font, value: defaultFont, range: fullRange)
        attributedString.addAttribute(.foregroundColor, value: self.textColor, range: fullRange)

        if let newlineIndex = text.firstIndex(of: "\n") {
            let nsRange = NSRange(text.startIndex..<newlineIndex, in: text)
            attributedString.addAttribute(.font, value: boldFont, range: nsRange)
        } else {
            let nsRange = NSRange(location: 0, length: text.count)
            attributedString.addAttribute(.font, value: boldFont, range: nsRange)
        }
        
        self.attributedText = attributedString
    }

}
