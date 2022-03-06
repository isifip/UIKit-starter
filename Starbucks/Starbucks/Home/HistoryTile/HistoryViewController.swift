//
//  HistoryViewController.swift
//  Starbucks
//
//  Created by Irakli Sokhaneishvili on 06.03.22.
//

import Foundation
import UIKit


class HistoryViewController: UITableViewController {
    
    let sampleData = [
        "1",
        "2",
        "3",
        "4",
        "5"
    ]
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    func layout() {
        navigationItem.title = "Sample"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = sampleData[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
