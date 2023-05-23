//
//  UIView+Layout.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//
import UIKit

extension UIView {
    
    func fillSuperview(withPadding padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        if let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        if let superViewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor {
            trailingAnchor.constraint(equalTo: superViewTrailingAnchor, constant: -padding.right).isActive = true
        }
        if let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
    }
}
