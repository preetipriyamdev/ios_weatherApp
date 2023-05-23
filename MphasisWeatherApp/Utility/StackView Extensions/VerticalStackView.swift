//
//  VerticalStackView.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//

import UIKit

class VerticalStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        self.spacing = spacing
        arrangedSubviews.forEach( { addArrangedSubview($0) } )
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
