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

//
//resultCount = 50;
//results =     (
//            {
//        artistId = 94804;
//        artistName = Sting;
//        artistViewUrl = "https://music.apple.com/us/artist/sting/94804?uo=4";
//        artworkUrl100 = "https://is2-ssl.mzstatic.com/image/thumb/Music112/v4/b1/aa/8f/b1aa8fa1-d12f-318c-bab8-130066ced7bb/19UMGIM20617.rgb.jpg/100x100bb.jpg";
//        artworkUrl30 = "https://is2-ssl.mzstatic.com/image/thumb/Music112/v4/b1/aa/8f/b1aa8fa1-d12f-318c-bab8-130066ced7bb/19UMGIM20617.rgb.jpg/30x30bb.jpg";
//        artworkUrl60 = "https://is2-ssl.mzstatic.com/image/thumb/Music112/v4/b1/aa/8f/b1aa8fa1-d12f-318c-bab8-130066ced7bb/19UMGIM20617.rgb.jpg/60x60bb.jpg";
//        collectionCensoredName = "Fields of Gold: The Best of Sting 1984-1994";
//        collectionExplicitness = notExplicit;
//        collectionId = 1455399771;
//        collectionName = "Fields of Gold: The Best of Sting 1984-1994";
//        collectionPrice = "9.99";
//        collectionViewUrl = "https://music.apple.com/us/album/fields-of-gold/1455399771?i=1455400094&uo=4";
//        country = USA;
//        currency = USD;
//        discCount = 1;
//        discNumber = 1;
//        isStreamable = 1;
//        kind = song;
//        previewUrl = "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/cf/02/f1/cf02f17f-6fac-bf20-255f-b00cd1268169/mzaf_5472059423905803400.plus.aac.p.m4a";
//        primaryGenreName = Pop;
//        releaseDate = "1993-02-25T12:00:00Z";
//        trackCensoredName = "Fields of Gold";
//        trackCount = 14;
//        trackExplicitness = notExplicit;
//        trackId = 1455400094;
//        trackName = "Fields of Gold";
//        trackNumber = 3;
//        trackPrice = "1.29";
//        trackTimeMillis = 219000;
//        trackViewUrl = "https://music.apple.com/us/album/fields-of-gold/1455399771?i=1455400094&uo=4";
//        wrapperType = track;
//    },
