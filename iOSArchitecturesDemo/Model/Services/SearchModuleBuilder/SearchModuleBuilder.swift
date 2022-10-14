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
    
    static func build() -> (UIViewController & SearchViewInput) {
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        return viewController
    }
    
}
