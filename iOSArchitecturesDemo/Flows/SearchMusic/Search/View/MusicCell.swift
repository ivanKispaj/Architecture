//
//  MusicCell.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 14.10.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class MusicCell: UITableViewCell {

    
    private let imageDownloader = ImageDownloader()
    // MARK: - Subviews
    
    private(set) lazy var trackName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var artistName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var albumName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    private(set) lazy var appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    @available(iOS 13.0, *)
    func configure(with cellModel: MusicCellModel) {
        if let iconUrl = cellModel.iconUrl {
            self.imageDownloader.getImage(fromUrl: iconUrl) { [weak self] (image, _) in
        self?.appIcon.image = image
            }
        } else {
            self.appIcon.image = UIImage(systemName: "circle.rectangle.dashed")
        }
        self.trackName.text = "Track: " + cellModel.trackName
        self.artistName.text = "Artist: " + cellModel.artistName
        self.albumName.text = "Album: " + cellModel.albumName
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.trackName, self.artistName, self.albumName].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addAppIcon()
        self.addTitleLabel()
        self.addSubtitleLabel()
        self.addRatingLabel()
    }
    
    private func addAppIcon() {
        self.contentView.addSubview(self.appIcon)
        NSLayoutConstraint.activate([
            self.appIcon.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            self.appIcon.heightAnchor.constraint(equalToConstant: 40),
            self.appIcon.widthAnchor.constraint(equalTo: self.appIcon.heightAnchor, multiplier: 1 / 1),
            self.appIcon.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    private func addTitleLabel() {
        self.contentView.addSubview(self.trackName)
        NSLayoutConstraint.activate([
            self.trackName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.trackName.leftAnchor.constraint(equalTo: self.appIcon.rightAnchor, constant: 12.0),
            self.trackName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addSubtitleLabel() {
        self.contentView.addSubview(self.artistName)
        NSLayoutConstraint.activate([
            self.artistName.topAnchor.constraint(equalTo: self.trackName.bottomAnchor, constant: 4.0),
            self.artistName.leftAnchor.constraint(equalTo: self.appIcon.rightAnchor, constant: 12.0),
            self.artistName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addRatingLabel() {
        self.contentView.addSubview(self.albumName)
        NSLayoutConstraint.activate([
            self.albumName.topAnchor.constraint(equalTo: self.artistName.bottomAnchor, constant: 4.0),
            self.albumName.leftAnchor.constraint(equalTo: self.appIcon.rightAnchor, constant: 12.0),
            self.albumName.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }

}
