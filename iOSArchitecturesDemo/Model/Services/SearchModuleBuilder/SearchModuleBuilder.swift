//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 14.09.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

final class SearchModuleBuilder {
    
    static func build() -> [UIViewController] {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let firstController = SearchViewController(presenter: presenter)
        firstController.navigationItem.title = "Search App"
        firstController.tabBarItem = UITabBarItem(title: "App", image: UIImage(systemName: "apps.iphone"), tag: 0)
        presenter.viewInput = firstController //as? any UIViewController & SearchViewInput
        router.viewController = firstController
        
        let musicRoute = SearchMusicRouter()
        let musicInteractor = SearchMusicInteractor()
        let musicPresenter = SearchMusicPresenter(interactor: musicInteractor, router: musicRoute)
        let secondVC = SearchMusicViewController(presenter: musicPresenter)
        secondVC.navigationItem.title = "Search Music"
        secondVC.tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note"), tag: 0)
        musicPresenter.viewInput = secondVC // as? any UIViewController & SearchMusicViewInput
        musicRoute.viewController = secondVC
        
        return [firstController, secondVC]
    }
    
}
