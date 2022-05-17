//
//  CountriesDB.swift
//  EditableTableView
//
//  Created by Student Account on 5/17/22.
//

import Foundation

class CountriesDB {
    
    var countries = [Country]()
    
    func addCountry(name: String) {
        let newCountry = Country(name: name)
        countries.append(newCountry)
    }
    
    
    init() {
        let country1 = Country(name: "Brazil")
        let country2 = Country(name: "Argentina")
        let country3 = Country(name: "USA")
        
        countries.append(country1)
        countries.append(country2)
        countries.append(country3)
    }
}
