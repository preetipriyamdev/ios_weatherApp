//
//  WeatherBaseController.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//

import UIKit
import SDWebImage
import CoreLocation

class WeatherBaseController: FlowLayoutCollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellID = "AppSearchViewCell"
    
    fileprivate var weatherModel: WeatherModel?
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    private var timer: Timer?
    private var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        // register cell
        collectionView.register(WeatherSearchViewCell.self, forCellWithReuseIdentifier: cellID)
        setupSearchBar()
        
        if let previousCity = UserDefaults.standard.string(forKey: "city") {
            self.fetchWeatherData(onRequestType: .cityName(city: previousCity))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager = CLLocationManager()
        determineMyCurrentLocation()
    }
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
    }
    
    fileprivate func fetchWeatherData(onRequestType: RequestType) {
        // start an async task
        Task {
            do {
                let weatherModel = try await Service.shared.fetchWeatherData(onRequestType: onRequestType)
                self.weatherModel = weatherModel
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // introducing some delays befor performing the search
        // throttling the search
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.fetchWeatherData(onRequestType: .cityName(city: searchText))
        })
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ((weatherModel?.cityName.count ?? 0) > 0) ? 1 : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? WeatherSearchViewCell else {
            print("error while dequeuing the AppSearchViewCell")
            return WeatherSearchViewCell()
        }
        
        cell.weatherData = weatherModel
        return cell
    }
    
}

// MARK: CoreLocation Delegate

extension WeatherBaseController: CLLocationManagerDelegate {
    
    func determineMyCurrentLocation() {
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            if let previousCity = UserDefaults.standard.string(forKey: "city") {
                self.fetchWeatherData(onRequestType: .cityName(city: previousCity))
            } else {
                locationManager?.startUpdatingLocation()
            }
        default:
            print("Failed to authorized")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        locationManager?.stopUpdatingLocation()
        self.fetchWeatherData(onRequestType: .coordinate(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Error from location manager \(error)")
    }
}
