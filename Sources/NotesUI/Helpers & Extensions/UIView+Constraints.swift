//
//  UIView+Constraints.swift
//  NotesUI
//
//  Created by James Wolfe on 19/01/2025.
//

import UIKit

public extension UIView {

    func constrainToSuperview(withEdgeInsets edgeInsets: UIEdgeInsets? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor,
                                 constant: edgeInsets?.top ?? .zero),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor,
                                      constant: edgeInsets?.right ?? .zero),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor,
                                    constant: edgeInsets?.bottom ?? .zero),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor,
                                     constant: edgeInsets?.left ?? .zero),
        ])
    }

    func constrainToSuperviewSafeArea(withEdgeInsets edgeInsets: UIEdgeInsets? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor,
                                 constant: edgeInsets?.top ?? .zero),
            trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor,
                                      constant: edgeInsets?.right ?? .zero),
            bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor,
                                    constant: edgeInsets?.bottom ?? .zero),
            leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor,
                                     constant: edgeInsets?.left ?? .zero),
        ])
    }

}
