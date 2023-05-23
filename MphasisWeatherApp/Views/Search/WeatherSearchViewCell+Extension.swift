//
//  WeatherSearchViewCell+Extension.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//

import UIKit

extension WeatherSearchViewCell {
    
    func addSubViews() {
        // satck view to add constraints to icons and labels
        let infoTopStackView = HorizontalStackView(arrangedSubviews: [
            weatherIconImageView,
            VerticalStackView(arrangedSubviews: [ // label stack view
                CityName, categoryLabel, ratingLabel
            ])
        ], spacing: 12, alignment: .center)
        
        // stack view to give constraints to all the UIElements in a cell
        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoTopStackView, backGroundView
        ], spacing: 16)
        
        contentView.addSubview(overallStackView)
        overallStackView.fillSuperview(withPadding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    // The feature is incomplete. If I had more time,
    // I would have displayed backgound image based on the weather.
    func backGroundImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .green
        imageView.image = UIImage (named: "Image")
        return imageView
    }
    
    func temperature(_ val: Int) -> Int {
        return Int((Double(val) - 273.15) * (9/5) + 32)
    }
}
