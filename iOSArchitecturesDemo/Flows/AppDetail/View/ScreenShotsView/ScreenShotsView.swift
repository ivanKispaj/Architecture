//
//  ScreenShotsView.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 11.09.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class ScreenShotsView: UIView {
    //MARK: - Name block
    let textBlock = "Обзор"
    
    // MARK: - Subviews
    private(set) lazy var blockName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = self.textBlock
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        return collection
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

    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addHeaderLabel()
        self.addCollectionView()
        setupConstraints()
    }
    
    private func addHeaderLabel() {
        self.addSubview(self.blockName)
    }

    private func addCollectionView() {
        self.addSubview(self.collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.blockName.topAnchor.constraint(equalTo: self.topAnchor),
            self.blockName.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.blockName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.blockName.bottomAnchor, constant: 5),
            self.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor),
            self.heightAnchor.constraint(equalToConstant: 540),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

extension UICollectionView {
    func scrollToNextItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func scrollToPreviousItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func moveToFrame(contentOffset : CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
    }
}
