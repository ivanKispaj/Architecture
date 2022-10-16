//
//  MusicCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 14.10.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

struct MusicCellModel {
    let trackName: String
    let artistName: String
    let albumName: String
    let iconUrl: String?
    let price: String
}


final class MusicCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> MusicCellModel {
        var price = ""
        var artistName = ""
        var albumName = ""
        if let trackPrice = model.trackPrice,
           let currency = model.currency,
           let artName = model.artistName,
           let albmName = model.collectionName
        
        {
            price = String(trackPrice) + ": " + currency
            artistName = artName
            albumName = albmName
            
        }
        return MusicCellModel(trackName: model.trackName,
                              artistName: artistName,
                              albumName: albumName,
                              iconUrl: model.artwork,
                              price: price
        
        )
    }
}
