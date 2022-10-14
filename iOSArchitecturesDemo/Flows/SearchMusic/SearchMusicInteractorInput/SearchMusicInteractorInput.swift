//
//  SearchMusicInteractorInput.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 14.10.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Alamofire

protocol SearchMusicInteractorInput {
    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

final class SearchMusicInteractor: SearchMusicInteractorInput {
    
    private let searchService = ITunesSearchService()
    
    func requestSong(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        self.searchService.getSongs(forQuery: query, completion: completion)
    }
}
