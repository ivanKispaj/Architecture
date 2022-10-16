//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    let app: ITunesApp
    lazy var screenShotsController = ScreenShotsViewController(app: self.app)
    lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
    lazy var watsNewController = WatsNewViewController(app: self.app)
    
    //MARK: - init
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        let scrollView = UIScrollView(frame: .zero)
        scrollView.alwaysBounceVertical = true
        self.view = scrollView

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()

    }
  
    
    //MARK: - Configure UI
    private func configureUI() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.largeTitleDisplayMode = .never
        self.addHeaderViewController()
        var separator = self.addSeparator(after: self.headerViewController.view)
        self.addWatsNewViewController(before: separator)
        separator  = self.addSeparator(after: self.watsNewController.view)
        self.addScreenShotsViewController(before: separator)
    }
    

    private func addHeaderViewController() {
        self.addChild(self.headerViewController)
        self.view.addSubview(self.headerViewController.view)
        self.headerViewController.didMove(toParent: self)
        self.headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headerViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerViewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerViewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerViewController.view.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    private func addWatsNewViewController(before view: UIView) {
        // TODO: ДЗ, сделать другие сабмодули
        self.addChild(watsNewController)
        self.view.addSubview(watsNewController.view)
        watsNewController.didMove(toParent: self)
        watsNewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            watsNewController.view.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            watsNewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            watsNewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            watsNewController.view.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    private func addScreenShotsViewController(before view: UIView) {
        self.addChild(self.screenShotsController)
        self.view.addSubview(self.screenShotsController.view)
        self.screenShotsController.didMove(toParent: self)
        self.screenShotsController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.screenShotsController.view.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            self.screenShotsController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.screenShotsController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.screenShotsController.view.bottomAnchor),
        ])
    }
    
    private func addSeparator(after view: UIView) -> UIView {
        let separator = BlockSeparator()
        self.view.addSubview(separator)
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            separator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20)
        ])
        return separator
    }
    
 
}
