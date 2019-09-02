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
        let sortedSongs = songsNSArray.sortedArray(using: [descriptor])
        print(sortedSongs)
    }

}

