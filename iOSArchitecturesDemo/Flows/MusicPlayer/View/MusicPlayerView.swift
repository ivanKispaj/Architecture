//
//  MusicPlayerView.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 16.10.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

protocol PlayButtonToggle: AnyObject {
    func playStop(_ state: Bool)
}


class MusicPlayerView: UIView {
    
    // MARK: - Subviews
    private(set) lazy var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
 
    private(set) lazy var trackName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private(set) lazy var playerView: UIView = {
        let playerView = UIView()
        playerView.backgroundColor = .brown
        playerView.translatesAutoresizingMaskIntoConstraints = false
        return playerView
    }()
    
    private(set) lazy var playIcon: UIImageView = {
        let playIcon = UIImageView()
        playIcon.image = UIImage(systemName: "stop.circle")
        playIcon.tintColor = .cyan
        playIcon.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(playStop))
        playIcon.addGestureRecognizer(tap)
        playIcon.translatesAutoresizingMaskIntoConstraints = false
        return playIcon
    }()
    
    private(set) lazy var playerProgress: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .red
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    private(set) lazy var totalTime: UILabel = {
        let label = UILabel()
        label.text = "0:30"
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
     
    private(set) lazy var passedtime: UILabel = {
        let label = UILabel()
        label.text = "0:00"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    weak var playDelegate: PlayButtonToggle!
    var playState: Bool = false
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }

    public func configure(with data: ITunesSong) {
        
    }
    
    private func setupLayout() {
        self.addSubview(logoView)
        self.addSubview(trackName)
        self.playerView.addSubview(playIcon)
        self.playerView.addSubview(passedtime)
        self.playerView.addSubview(playerProgress)
        self.playerView.addSubview(totalTime)
        self.addSubview(playerView)
        NSLayoutConstraint.activate([
            self.logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            self.logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoView.widthAnchor.constraint(equalToConstant: 150),
            self.logoView.heightAnchor.constraint(equalTo: self.logoView.widthAnchor, multiplier: 1 / 1),
            self.trackName.centerXAnchor.constraint(equalTo: self.logoView.centerXAnchor),
            self.trackName.topAnchor.constraint(equalTo: self.logoView.bottomAnchor, constant: 20),
            self.playerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.trailingAnchor.constraint(equalTo: self.playerView.trailingAnchor, constant: 20),
            self.playerView.topAnchor.constraint(equalTo: self.trackName.bottomAnchor, constant: 20),
            self.playerView.heightAnchor.constraint(equalToConstant: 40),
            self.bottomAnchor.constraint(greaterThanOrEqualTo: self.playerView.bottomAnchor),
            self.playIcon.heightAnchor.constraint(equalToConstant: 30),
            self.playIcon.widthAnchor.constraint(equalTo: self.playIcon.heightAnchor, multiplier: 1 / 1),
            self.playIcon.leadingAnchor.constraint(equalTo: self.playerView.leadingAnchor, constant: 10),
            self.playIcon.centerYAnchor.constraint(equalTo: self.playerView.centerYAnchor),
            self.passedtime.leadingAnchor.constraint(equalTo: self.playIcon.trailingAnchor, constant: 10),
            self.passedtime.centerYAnchor.constraint(equalTo: self.playerView.centerYAnchor),
            self.passedtime.widthAnchor.constraint(equalToConstant: 30),
            self.playerProgress.leadingAnchor.constraint(equalTo: self.passedtime.trailingAnchor, constant: 20),
            self.playerProgress.centerYAnchor.constraint(equalTo: self.playerView.centerYAnchor),
            self.playerView.trailingAnchor.constraint(equalTo: self.totalTime.trailingAnchor, constant: 20),
            self.totalTime.centerYAnchor.constraint(equalTo: self.playerView.centerYAnchor),
            self.totalTime.widthAnchor.constraint(equalToConstant: 40),
            self.totalTime.leadingAnchor.constraint(equalTo: self.playerProgress.trailingAnchor, constant: 10)
        ])
        
        
    }
    
    @objc func playStop() {
        self.playState.toggle()
        self.playDelegate.playStop(self.playState)
    }
}


