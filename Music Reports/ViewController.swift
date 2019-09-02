//
//  ViewController.swift
//  Music Reports
//
//  Created by Davi Pereira Neto on 23/08/19.
//  Copyright © 2019 Davi Pereira Neto. All rights reserved.
//

import UIKit
import MediaPlayer

class HomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureViewAttributes()
        testMPMediaQuery()
    }

    private func configureViewAttributes() {
        self.title = "Top Songs"
    }
    
    private func testMPMediaQuery() {
        let query = MPMediaQuery.songs()
        guard let songs = query.items else { return }
        let descriptor = NSSortDescriptor(key: MPMediaItemPropertyLastPlayedDate, ascending: false)
        let songsNSArray = NSArray(array: songs)
        let sortedSongs = songsNSArray.sortedArray(using: [descriptor]) as! [MPMediaItem]
        for song in filterSongsByLast7Days(sortedSongs) {
            print(song)
        }
    }
    
    private func filterSongsByLast7Days(_ songs: [MPMediaItem]) -> [MPMediaItem] {
        let date = Date().getDateIgnoringTime()
        guard let lastWeek = date?.getDateAdding(.day, value: -7) else { return songs }
        return songs.filter { $0.lastPlayedDate != nil && $0.lastPlayedDate! >= lastWeek }
    }

}

extension MPMediaItem {
    
    override open var description: String {
        let title = self.title ?? "No title"
        let artist = self.artist ?? "No artist"
        let lastPlayedString = self.lastPlayedDate != nil ? self.lastPlayedDate!.getSimpleString() : "No data"
        let desc = "---------- SONG----------\n\(artist) - \(title)\nPlayed \(self.playCount) times, skipped \(self.skipCount). Last played on \(lastPlayedString)\n"
        return desc
    }
    
}

