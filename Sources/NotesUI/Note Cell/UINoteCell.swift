//
//  UINoteCell.swift
//  NotesUI
//
//  Created by James Wolfe on 19/01/2025.
//

import UIKit

public class UINoteCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()

    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()

    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()

    public var title: String = "" {
        didSet {
            updateContent()
        }
    }

    public var body: String = "" {
        didSet {
            updateContent()
        }
    }

    public var textColor: UIColor = .black {
        didSet {
            updateContent()
        }
    }

    public override var backgroundColor: UIColor? {
        didSet {
            updateContent()
        }
    }

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateContent() {
        titleLabel.textColor = textColor
        bodyLabel.textColor = textColor.withAlphaComponent(0.5)
        titleLabel.text = title
        bodyLabel.text = body
    }

    private func setup() {
        contentView.addSubview(contentStack)
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(bodyLabel)
        contentStack.constrainToSuperview()
        contentStack.isLayoutMarginsRelativeArrangement = true
        contentStack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

}
