//
//  ViewController.swift
//  Music Reports
//
//  Created by Davi Pereira Neto on 23/08/19.
//  Copyright © 2019 Davi Pereira Neto. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureViewAttributes()
    }

    private func configureViewAttributes() {
        self.title = "Top Songs"
        //just a comment test
    }

}

