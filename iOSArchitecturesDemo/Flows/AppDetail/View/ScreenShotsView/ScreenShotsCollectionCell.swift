//
//  ScreenShotscollectionCell.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 11.09.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class ScreenShotsCollectionCell: UICollectionViewCell {
 
    private let imageDownloader = ImageDownloader()
    
    private(set) lazy var appScreenShots: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    override func prepareForReuse() {
        self.appScreenShots.image = nil
        
    }
   //MARK: - Configure Cell
    func configureCell(with url: String) {
        self.imageDownloader.getImage(fromUrl: url) {  (image, _) in
            self.appScreenShots.image = image
        }
    }
    //MARK: - Private method
    private func configureUI() {
        self.contentView.addSubview(self.appScreenShots)
        NSLayoutConstraint.activate([
            self.appScreenShots.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 0),
            self.contentView.bottomAnchor.constraint(equalTo: self.appScreenShots.bottomAnchor ,constant: 0),
            self.appScreenShots.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 0),
            self.appScreenShots.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: 0)
        ])
    }
}
