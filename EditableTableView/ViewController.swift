//
//  ViewController.swift
//  EditableTableView
//
//  Created by Student Account on 5/17/22.
//

import UIKit

class ViewController: UITableViewController {

    var data : CountriesDB!
    var countries = ["Canada", "Portugal", "Chile", "China", "Russia", "Australia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCountry() {
        if (countries.count > 0) {
            // add random country
            let randomIndex = Int(arc4random_uniform(UInt32(countries.count)))
            data.addCountry(name: countries[randomIndex])
            //update tableview row
            let indexPath = IndexPath(row: data.countries.count-1, section: 0)
            tableView.insertRows(at:[indexPath], with: .automatic)

            //remove random country from country array
            countries.remove(at: randomIndex)
            
            
        }
    }
    @IBAction func EditToggle(_ sender: UIButton) {
        if isEditing {
            setEditing(false, animated: true)
            sender.setTitle("Edit", for: .normal)
        }
        else {
            setEditing(true, animated: true)
            sender.setTitle("Done", for: .normal)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data.countries[indexPath.row].name
        cell.detailTextLabel?.text = ""
        
        return cell
    }


}

