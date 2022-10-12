//
//  BlockSeparator.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 11.09.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class BlockSeparator: UIView {

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
        if #available(iOS 13.0, *) {
            self.backgroundColor = .systemGray5
        } else {
            self.backgroundColor = .systemGray
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
