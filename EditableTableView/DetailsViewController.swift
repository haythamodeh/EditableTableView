//
//  DetailsViewController.swift
//  EditableTableView
//
//  Created by Student Account on 6/2/22.
//

import Foundation
import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet var countryTextField: UITextField!
    @IBOutlet var pointsTextField: UITextField!
    
    var country: Country!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        countryTextField.text = country.name
        pointsTextField.text = "\(country.points)"
    }
}

