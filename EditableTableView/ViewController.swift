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
    
    // Create a standard header that includes the returned text.
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        
       return "Countries"
    }
    // Create a standard footer that includes the returned text.
    override func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
       return "End of countries list"
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if( editingStyle == .delete) {
                countries.append(data.countries[indexPath.row].name)
                data.remove(atIndex: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            switch segue.identifier {
                case "showItem":
                if let row = tableView.indexPathForSelectedRow?.row {
                    let country = data.countries[row]
                    let detailViewController = segue.destination as! DetailViewController

                    detailViewController.country = country
                }
            default:
                preconditionFailure("Unexpected segue")
            }
        }


}

