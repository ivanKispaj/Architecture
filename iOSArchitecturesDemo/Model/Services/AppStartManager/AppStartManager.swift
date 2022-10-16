//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let rootVC = SearchModuleBuilder.build()
        let navVC = self.configureTabBarController(with: rootVC)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    private func configureTabBarController(with controllers: [UIViewController]) -> UITabBarController {
        let tabBar = UITabBarController()
        var navControllers: [UINavigationController] = []
        for controller in controllers {
            navControllers.append(self.configureNavigationController(with: controller))
        }
        tabBar.viewControllers = navControllers
        tabBar.tabBar.tintColor = .cyan
        tabBar.tabBar.unselectedItemTintColor = .blue
        return tabBar
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.cyan]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        return navVC
    }()
    
    private func configureNavigationController(with controller: UIViewController) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: controller)
        navController.navigationBar.barTintColor = UIColor.varna
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.cyan]
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]
        return navController
    }
}

extension UINavigationController {
    open override var shouldAutorotate: Bool {
        return false
    }
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
