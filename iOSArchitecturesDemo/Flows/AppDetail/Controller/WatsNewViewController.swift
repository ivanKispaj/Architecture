//
//  WatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 11.09.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit


class WatsNewViewController: UIViewController {
    
    private let app: ITunesApp
    private var watsNewView: WatsNewView {
        return self.view as! WatsNewView
    }
    
    // MARK: - Init //
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() { super.loadView()
        self.view = WatsNewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    //MARK: - private
    private func fillData() {
        self.watsNewView.version.text = "Версия \(app.version!)"
        self.watsNewView.reliseDate.text = app.currentVersionReleaseDate
        self.watsNewView.versionDescription.text = app.appDescription
        
    }
}
