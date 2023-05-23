//
//  HorizontalStackView.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//

import UIKit

class HorizontalStackView: UIStackView {

    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        self.spacing = spacing
        arrangedSubviews.forEach( { addArrangedSubview($0) } )
        self.axis = .horizontal
    }
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment?) {
        super.init(frame: .zero)
        self.spacing = spacing
        arrangedSubviews.forEach( { addArrangedSubview($0) } )
        self.alignment = setAlignmentProperty(with: alignment)
    }
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0, distribution: UIStackView.Distribution?) {
        super.init(frame: .zero)
        self.spacing = spacing
        arrangedSubviews.forEach( { addArrangedSubview($0) } )
        self.distribution = setDistributionProperty(with: distribution)
    }
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0, alignment: UIStackView.Alignment?, distribution: UIStackView.Distribution?) {
        super.init(frame: .zero)
        self.spacing = spacing
        arrangedSubviews.forEach( { addArrangedSubview($0) } )
        self.alignment = setAlignmentProperty(with: alignment)
        self.distribution = setDistributionProperty(with: distribution)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAlignmentProperty(with alignment: UIStackView.Alignment?) -> UIStackView.Alignment {
        if let alignment = alignment {
            return alignment
        }
        return self.alignment
    }
    
    private func setDistributionProperty(with distribution: UIStackView.Distribution?) -> UIStackView.Distribution {
        if let distribution = distribution {
            return distribution
        }
        return self.distribution
    }
}
