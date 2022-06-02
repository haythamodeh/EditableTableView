//
//  Country.swift
//  EditableTableView
//
//  Created by Student Account on 5/17/22.
//

import Foundation


class Country {
    var name: String!
    var points: Int
    
    init(name: String) {
        self.name = name
        self.points = Int.random(in: 1...99)
    }
}
