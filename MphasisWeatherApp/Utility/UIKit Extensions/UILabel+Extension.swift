//
//  UILabel.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//

import UIKit

extension UILabel {
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}

