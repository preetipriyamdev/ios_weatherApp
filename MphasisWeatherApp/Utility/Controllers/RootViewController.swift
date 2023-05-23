//
//  RootViewController.swift
//  MphasisWeatherApp
//
//  Created by Preeti Priyam on 5/22/23.
//

import UIKit

class RootViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        
        viewControllers = [
            createNavController(viewController: WeatherBaseController(), title: "Search")
        ]
        
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String) -> UIViewController {
        let navContoller = UINavigationController(rootViewController: viewController)
        navContoller.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        return navContoller
        
    }
    
    // configure the background appearance
    private func configureAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .secondarySystemBackground
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        
    }
}

