//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 14.09.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocol
protocol SearchViewInput: AnyObject {
    var searchResults: [ITunesApp] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
    
}

protocol SearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(_ app: ITunesApp)
    
}

//MARK: - Class presenter
final class SearchPresenter {
    
    private let searchService = ITunesSearchService()
    weak var viewInput: ( UIViewController & SearchViewInput)?
    
    private func requestApps(with query: String) {
        self.searchService.getApps(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                    
                }
            
        }
    }
    
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController(app: app)
        self.viewInput?.navigationController?.pushViewController(appDetaillViewController, animated: true)
        
    }
    
}

extension SearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestApps(with: query)
    }
    func viewDidSelectApp(_ app: ITunesApp) {
        self.openAppDetails(with: app)
    }
    
}
