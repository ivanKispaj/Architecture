//
//  MusicPlayerViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 16.10.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit
import AVFoundation
class MusicPlayerViewController: UIViewController {

    // MARK: - Properties
    private let app: ITunesSong
    private var musicHeaderView: MusicPlayerView {
        return self.view as! MusicPlayerView
    }
    private let imageDownloader = ImageDownloader()
    private let player = AVQueuePlayer()
    private var previewTime: Float = 0 // время проигрывания
    
    var timer = Timer()
    var currentProgress: Float = 0
    //MARK: life cycle
    override func loadView() {
        super.loadView()
        self.view = MusicPlayerView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.musicHeaderView.playDelegate = self
       
        if let url = self.app.artwork {
            self.imageDownloader.getImage(fromUrl: url) { image, error in
                self.musicHeaderView.logoView.image = image
            }
        }
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.timer.invalidate()
        
    }

    // MARK: - Init
    init(app: ITunesSong) {
        self.app = app
       
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func playMusic(with url: String) {
        guard let songUrl = URL(string: url) else { return }
            player.removeAllItems()
            player.insert(AVPlayerItem(url: songUrl), after: nil)
        self.musicHeaderView.playIcon.image = UIImage(systemName: "pause.circle")
        self.musicHeaderView.playerProgress.setProgress(0, animated: false)
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeUp), userInfo: nil, repeats: true)
        self.timer.fire()
        player.play()
    }
}


extension MusicPlayerViewController: PlayButtonToggle {
    func playStop(_ state: Bool) {
        if state {
            if let songUrl = app.previewUrl {
                if self.previewTime != 0 {
                    self.player.play()
                } else {
                    self.playMusic(with: songUrl)
                }
                
            }
            
            self.musicHeaderView.playIcon.image = UIImage(systemName: "play.circle")
        } else {
            self.player.pause()
            self.musicHeaderView.playIcon.image = UIImage(systemName: "pause.circle")
        }
    }
    
    @objc func timeUp() {
        if self.musicHeaderView.playState {
            
            let step: Float = 100 / 30
            self.previewTime += step
            let progress: Float = self.previewTime / 100
                self.musicHeaderView.playerProgress.setProgress(progress, animated: true)

            if self.previewTime >= 100 {
                self.timer.invalidate()
                self.player.pause()
                self.musicHeaderView.playIcon.image = UIImage(systemName: "stop.circle")
                self.musicHeaderView.playState = false
                self.previewTime = 0
            }
        }
    }
}
