//
//  TabBarController.swift
//  CulinaryCalculator
//
//  Created by Кристина Максимова on 02.03.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .white
        tabBar.backgroundColor = ColorsLibrary.brownAlpha
        
        let mainVC = MainViewController()
        let recipesVC = RecipesController()
        let mainImage = UIImage(systemName: "function")!
        let recipesImage = UIImage(systemName: "menucard.fill")!
        viewControllers = [
            generateNavVC(rootVC: mainVC, title: "Калькулятор", image: mainImage),
            generateNavVC(rootVC: recipesVC, title: "Рецепты", image: recipesImage)
        ]
    }
    
    private func generateNavVC(rootVC: UIViewController,
                               title: String,
                               image: UIImage) -> UIViewController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = image
        return navVC
    }
}
