//
//  WatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 11.09.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class WatsNewView: UIView  {
    
    // MARK: - fixed property
    private let nameBlock = "Что нового"
    // MARK: - Subviews
    private(set) lazy var blockName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = nameBlock
        return label
    }()

    private(set) lazy var version: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private(set) lazy var reliseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private(set) lazy var versionDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 10
        return label
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    private func setupLayout() {
        self.addSubview(self.blockName)
        self.addSubview(self.version)
        self.addSubview(self.reliseDate)
        self.addSubview(self.versionDescription)
        NSLayoutConstraint.activate([
            self.blockName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.blockName.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 15),
            self.blockName.trailingAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.version.topAnchor.constraint(equalTo: self.blockName.bottomAnchor, constant: 10),
            self.version.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            self.reliseDate.centerYAnchor.constraint(equalTo: self.version.centerYAnchor),
            self.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: self.reliseDate.rightAnchor , constant: 15),
            self.reliseDate.leadingAnchor.constraint(greaterThanOrEqualTo: self.version.trailingAnchor),
            self.versionDescription.topAnchor.constraint(equalTo: self.version.bottomAnchor, constant: 10),
            self.versionDescription.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor,constant: 10),
            self.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.versionDescription.trailingAnchor ,constant: 10),
            self.versionDescription.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
}
