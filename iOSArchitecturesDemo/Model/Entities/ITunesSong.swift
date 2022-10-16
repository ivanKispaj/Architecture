//
//  ITunesSong.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

public struct ITunesSong: Codable {
    
    public var trackName: String // Название трека
    public var artistName: String? // Имя артиста
    public var collectionName: String? // Название альбома
    public var artwork: String? // URL логотипа
    public var previewUrl: String? // URL предпрослушивания
    public var trackPrice: Double? // цена за песню
    public var currency: String? // тип валюты
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case trackName = "trackName"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case artwork = "artworkUrl100"
        case previewUrl = "previewUrl"
        case trackPrice = "trackPrice"
        case currency = "currency"
    }
    
    // MARK: - Init
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.trackName = try container.decode(String.self, forKey: .trackName)
        self.artistName = try container.decodeIfPresent(String.self, forKey: .artistName)
        self.collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        self.artwork = try container.decode(String.self, forKey: .artwork)
        self.trackPrice = try container.decodeIfPresent(Double.self, forKey: .trackPrice)
        self.previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl)
        self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
       
        
    }
    
    internal init(trackName: String,
                  artistName: String?,
                  collectionName: String?,
                  artwork: String?,
                  previewUrl: String?,
                  trackPrice: Double?,
                  currency: String?
                ) {
        self.trackName = trackName
        self.artistName = artistName
        self.collectionName = collectionName
        self.artwork = artwork
        self.previewUrl = previewUrl
        self.trackPrice = trackPrice
        self.currency = currency
    }
}


