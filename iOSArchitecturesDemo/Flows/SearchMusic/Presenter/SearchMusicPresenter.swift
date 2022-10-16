//
//  SearchMusicPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 14.10.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

//MARK: - Protocol
protocol SearchMusicViewInput: AnyObject {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
    
}

protocol SearchMusicViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(_ song: ITunesSong)
    
}

//MARK: - Class presenter
final class SearchMusicPresenter {
    
    let interactor: SearchMusicInteractorInput
    let router: SearchMusicRouterInput
    weak var viewInput: ( UIViewController & SearchMusicViewInput)?
    
    init(interactor: SearchMusicInteractorInput, router: SearchMusicRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestSong(with query: String) {
        self.interactor.requestSong(with: query) { [weak self] result in
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

extension SearchMusicPresenter: SearchMusicViewOutput {
    
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestSong(with: query)
    }
    
    func viewDidSelectSong(_ song: ITunesSong) {
        self.router.openMusicDetails(for: song)
    }
    
}

