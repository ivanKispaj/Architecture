//
//  SearchMusicRouterInput.swift
//  iOSArchitecturesDemo
//
//  Created by Ivan Konishchev on 14.10.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol SearchMusicRouterInput {
    func openMusicDetails(for song: ITunesSong)
  //  func openMusicInITunes(_ song: ITunesSong)
}

final class SearchMusicRouter: SearchMusicRouterInput {
    
    weak var viewController: UIViewController?
    
    func openMusicDetails(for song: ITunesSong) {
      //  let musicDetaillViewController = MusicDetailViewController(app: song)
     //   self.viewController?.navigationController?.pushViewController(musicDetaillViewController, animated: true)
    }
    
//    func openAppInITunes(_ app: ITunesSong) {
//        guard let urlString = app.appUrl, let url = URL(string: urlString) else {return}
//
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//
//    }
}
