//
//  AutocompleteViewController.swift
//  Crimper Calculator
//
//  Created by Mona Wright on 12/3/16.
//  Copyright © 2016 Mona Wright. All rights reserved.
//

import UIKit

class AutocompleteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var optionSelectedBlock:((_ selectedOption:String)->Void)?
    var options:[String] = []
    var filter:String = "" {
        didSet {
            if tableView != nil {
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func filteredOptions() -> [String] {
        return options.filter { (toInclude:String) -> Bool in
            return toInclude.uppercased().contains(filter.uppercased())
        }
    }

}

extension AutocompleteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let filtered = filteredOptions()
        return filtered.count == 0 ? 1 : filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let filtered = filteredOptions()
        if filtered.count == 0 {
            cell.textLabel?.text = "No match found"
        }
        else {
            cell.textLabel?.text = filtered[indexPath.row]
        }
        return cell
    }
    
}

extension AutocompleteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let block = optionSelectedBlock else {
            return
        }
        let filtered = filteredOptions()
        if filtered.count > 0 {
            block(filtered[indexPath.row])
        }
    }
    
}
