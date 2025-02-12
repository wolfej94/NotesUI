//
//  UISearchField.swift
//  NotesUI
//
//  Created by James Wolfe on 19/01/2025.
//

import UIKit

public protocol UISearchFieldDelegate: AnyObject {
    func searchFieldEditingDidChange(_ searchText: String)
}

public class UISearchField: UIView {

    public weak var delegate: UISearchFieldDelegate?

    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = placeholder
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.borderStyle = .none
        searchBar.showsCancelButton = false
        searchBar.searchTextField.font = .systemFont(ofSize: 17, weight: .regular)
        return searchBar
    }()
    
    public var text: String? {
        get {
            searchBar.searchTextField.text
        }
        set {
            searchBar.searchTextField.text = newValue
            delegate?.searchFieldEditingDidChange(newValue ?? "")
        }
    }

    public var placeholder: String? = "" {
        didSet {
            updateContent()
        }
    }

    public var fieldBackgroundColor: UIColor? {
        didSet {
            updateContent()
        }
    }

    public var placeholderColor: UIColor? = .black.withAlphaComponent(0.4) {
        didSet {
            updateContent()
        }
    }

    public var textColor: UIColor? = .black {
        didSet {
            updateContent()
        }
    }
    
    public var borderColor: UIColor? = .gray.withAlphaComponent(0.4) {
        didSet {
            updateContent()
        }
    }

    public init(placeholder: String = "",
                fieldBackgroundColor: UIColor = .white,
                placeholderColor: UIColor? = nil,
                borderColor: UIColor? = nil,
                textColor: UIColor = .black) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.fieldBackgroundColor = fieldBackgroundColor
        self.placeholderColor = placeholderColor
        self.textColor = textColor
        self.borderColor = borderColor
        setup()
        updateContent()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        addSubview(searchBar)
        let edgeInsets = UIEdgeInsets(top: .zero,
                                      left: 10,
                                      bottom: .zero,
                                      right: -10)
        searchBar.constrainToSuperview(withEdgeInsets: edgeInsets)
        searchBar.searchTextField.font = .systemFont(ofSize: 17, weight: .regular)
    }

    private func updateContent() {
        searchBar.backgroundColor = fieldBackgroundColor
        searchBar.searchTextField.textColor = textColor
        if let placeholder, let placeholderColor {
            searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: placeholderColor]
            )
        }
        searchBar.searchTextField.borderStyle = .roundedRect
        if let placeholderColor {
            searchBar.searchTextField.leftView?.tintColor = placeholderColor
        }
        if let borderColor {
            searchBar.layer.borderColor = borderColor.cgColor
            searchBar.layer.borderWidth = 1
            searchBar.layer.cornerRadius = 8
        }
    }
}

extension UISearchField: UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchFieldEditingDidChange(searchText)
    }

    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }

    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        delegate?.searchFieldEditingDidChange("")
    }
}
