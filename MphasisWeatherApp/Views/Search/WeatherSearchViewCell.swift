//
//  WeatherSearchViewCell.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//

import UIKit

class WeatherSearchViewCell: UICollectionViewCell {
    
    var weatherData: WeatherModel? {
        didSet {
            CityName.text = weatherData?.cityName
            categoryLabel.text = weatherData?.country
            ratingLabel.text = "Feels like: \(temperature(Int(weatherData?.feelsLikeTemperature ?? 0)))°F"
            weatherIconImageView.image = UIImage(systemName: weatherData?.systemIconNameString ?? "")
        }
    }
    
    
    let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let CityName = UILabel()
    let categoryLabel = UILabel()
    let ratingLabel = UILabel()
    
    lazy var backGroundView = self.backGroundImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

