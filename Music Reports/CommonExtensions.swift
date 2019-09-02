//
//  CommonExtensions.swift
//  Music Reports
//
//  Created by Davi Pereira Neto on 02/09/19.
//  Copyright © 2019 Davi Pereira Neto. All rights reserved.
//

import Foundation

extension Date {
    
    func getSimpleString(onlyDate: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        if onlyDate {
            formatter.timeStyle = .none
        } else {
            formatter.timeStyle = .medium
        }
        return formatter.string(from: self)
    }
    
}
