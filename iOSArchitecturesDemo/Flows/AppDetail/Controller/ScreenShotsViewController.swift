//
//  ScreenShotsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 11.09.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class ScreenShotsViewController: UIViewController {
    
    private let app: ITunesApp
    private let imageDownloader = ImageDownloader()
    private var screenShotsView: ScreenShotsView { return self.view as! ScreenShotsView }
    
    private struct Constants {
        static let reuseIdentifier = "screenShotsId"
    }
    
    
    // MARK: - Init
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        let views = ScreenShotsView()
        self.view = views
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screenShotsView.collectionView.register(ScreenShotsCollectionCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
        self.screenShotsView.collectionView.delegate = self
        self.screenShotsView.collectionView.dataSource = self
    }

 
}

//MARK: - Collection dataSource
extension ScreenShotsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = app.screenshotUrls.count
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as? ScreenShotsCollectionCell else {
            preconditionFailure("Error cell identifier")
        }
        cell.configureCell(with: app.screenshotUrls[indexPath.row])
        return cell
    }
    
}

//MARK: - Collection FlowLayout
extension ScreenShotsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.view.frame.width / 1.6, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}

//MARK: - Collection delegate
extension ScreenShotsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select: \(indexPath.row)")
    }
}
