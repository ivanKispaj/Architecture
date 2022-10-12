//
//  ITunesApp.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

public struct ITunesApp: Codable {
    
    public typealias Bytes = Int
    
    public let appName: String
    public let appUrl: String?
    public let company: String?
    public let companyUrl: String?
    public let appDescription: String?
    public let averageRating: Float?
    public let averageRatingForCurrentVersion: Float?
    public let size: Bytes?
    public let iconUrl: String?
    public let screenshotUrls: [String]
    public let contentRating: String? // 12+
    public let reliseNotes: String? // описание изменений релиза
    public let currentVersionReleaseDate: String?
    public let version: String?
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case appName = "trackName"
        case appUrl = "artistViewUrl"
        case company = "sellerName"
        case companyUrl = "sellerUrl"
        case appDescription = "description"
        case averageRating = "averageUserRating"
        case averageRatingForCurrentVersion = "averageUserRatingForCurrentVersion"
        case size = "fileSizeBytes"
        case iconUrl = "artworkUrl512"
        case screenshotUrls = "screenshotUrls"
        case contentRating = "trackContentRating"
        case reliseNotes = "releaseNotes"
        case currentVersionReleaseDate = "currentVersionReleaseDate"
        case version = "version"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appName = try container.decode(String.self, forKey: .appName)
        self.appUrl = try? container.decode(String.self, forKey: .appUrl)
        self.company = try? container.decode(String.self, forKey: .company)
        self.companyUrl = try? container.decode(String.self, forKey: .companyUrl)
        self.appDescription = try? container.decode(String.self, forKey: .appDescription)
        self.averageRating = try? container.decode(Float.self, forKey: .averageRating)
        self.averageRatingForCurrentVersion = try? container.decode(Float.self, forKey: .averageRatingForCurrentVersion)
        self.size = (try? container.decode(String.self, forKey: .size)) >>- { Bytes($0) }
        self.iconUrl = try? container.decode(String.self, forKey: .iconUrl)
        self.screenshotUrls = (try? container.decode([String].self, forKey: .screenshotUrls)) ?? []
        self.contentRating = try? container.decode(String.self, forKey: .contentRating)
        self.reliseNotes = try? container.decode(String.self, forKey: .reliseNotes)
        self.currentVersionReleaseDate = try? container.decode(String.self, forKey: .currentVersionReleaseDate)
        self.version = try? container.decode(String.self, forKey: .version)
    }
    
    // MARK: - Init
    
    internal init(appName: String,
                  appUrl: String?,
                  company: String?,
                  companyUrl: String?,
                  appDescription: String?,
                  averageRating: Float?,
                  averageRatingForCurrentVersion: Float?,
                  size: Bytes?,
                  iconUrl: String?,
                  contentRating: String?,
                  reliseNotes: String?,
                  currentVersionReleaseDate: String?,
                  version: String?,
                  screenshotUrls: [String]) {
        self.appName = appName
        self.appUrl = appUrl
        self.company = company
        self.companyUrl = companyUrl
        self.appDescription = appDescription
        self.averageRating = averageRating
        self.averageRatingForCurrentVersion = averageRatingForCurrentVersion
        self.size = size
        self.iconUrl = iconUrl
        self.screenshotUrls = screenshotUrls
        self.contentRating = contentRating
        self.reliseNotes = reliseNotes
        self.currentVersionReleaseDate = currentVersionReleaseDate
        self.version = version
    }
}
